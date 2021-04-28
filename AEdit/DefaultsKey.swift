//
//  DefaultsKey.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-03-01.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//
//  CotEditor-3.8.9/CotEditor/Sources/DefaultKey.swift
//  https://radex.io/swift/nsuserdefaults/static/

import Foundation

public class DefaultsKeys: Hashable, CustomStringConvertible {
    public let rawValue: String

    public init(_ key: String) {
        self.rawValue = key
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }

    public static func == (lhs: DefaultsKeys, rhs: DefaultsKeys) -> Bool {
        lhs.rawValue == rhs.rawValue
    }

    public var description: String {
        return self.rawValue
    }

}

final class DefaultsKey<T>: DefaultsKeys { }

extension UserDefaults {
    
    // Directly supported types
    
    subscript(key: DefaultsKey<Bool>)->Bool {
        get { self.bool(forKey: key.rawValue) }
        set { self.set(newValue, forKey: key.rawValue) }
    }

    subscript(key: DefaultsKey<Int>)->Int {
        get { self.integer(forKey: key.rawValue) }
        set { self.set(newValue, forKey: key.rawValue) }
    }

    subscript(key: DefaultsKey<Float>)->Float {
        get { self.float(forKey: key.rawValue) }
        set { self.set(newValue, forKey: key.rawValue) }
    }

    subscript(key: DefaultsKey<Double>)->Double {
        get { self.double(forKey: key.rawValue) }
        set { self.set(newValue, forKey: key.rawValue) }
    }

    subscript(key: DefaultsKey<String>)->String? {
        get { self.string(forKey: key.rawValue) }
        set { self.set(newValue, forKey: key.rawValue) }
    }

    subscript(key: DefaultsKey<[String]>)->[String]? {
        get { self.stringArray(forKey: key.rawValue) }
        set { self.set(newValue, forKey: key.rawValue) }
    }
    
    subscript<T>(key: DefaultsKey<[T]>) -> [T] {
        get { self.array(forKey: key.rawValue) as? [T] ?? [] }
        set { self.set(newValue, forKey: key.rawValue) }
    }

    // Extension types
    
    subscript(key: DefaultsKey<UInt>)->UInt {
        get { UInt(exactly: self.integer(forKey: key.rawValue)) ?? 0 }
        set { self.set(newValue, forKey: key.rawValue) }
    }

    subscript(key: DefaultsKey<CGFloat>)->CGFloat {
        get { CGFloat(self.double(forKey: key.rawValue)) }
        set { self.set(newValue, forKey: key.rawValue) }
    }
    
    static func encode(_ value:NSSecureCoding)->Data {
        let encoder = NSKeyedArchiver(requiringSecureCoding: true)
        value.encode(with: encoder)
        encoder.finishEncoding()
        return encoder.encodedData
    }
    
    static func decode<T>(_ encoded:Data, _ value:inout T?) where T:NSSecureCoding {
        if let decoder = try? NSKeyedUnarchiver(forReadingFrom: encoded),
           let decoded = T(coder: decoder) {
            value = decoded
        } else {
            value = nil
        }
    }

    subscript<T>(key: DefaultsKey<T>)->T? where T:NSSecureCoding {
        // NOTE has to match what preferences view bindings on storyboard are doing
        get {
            if let encoded = self.data(forKey:key.rawValue) {
                var decoded: T?
                UserDefaults.decode(encoded, &decoded)
                //print(className, "[]get", key, decoded)
                return decoded
            } else {
                print(className, "[]get", key, "nil")
                return nil
            }
        }
        set {
            //print(className, "[]set", key, newValue ?? "nil")
            if let newValue = newValue {
                let encoded = UserDefaults.encode(newValue)
                setValue(encoded, forKey:key.rawValue)
            } else {
                setValue(nil, forKey:key.rawValue)
            }
        }
    }

    /// reset to factory value
    func reset<T>(key: DefaultsKey<T>) {
        self.removeObject(forKey:key.rawValue)
    }

}


// CotEditor-3.8.9/CotEditor/Sources/DefaultKey+Observation.swift
extension UserDefaults {
    
    func observe<T>(key: DefaultsKey<T>, options: NSKeyValueObservingOptions = [], changeHandler: @escaping (_ change: DefaultsObserver.Change<T>) -> Void) -> DefaultsObserver {
        let observer = DefaultsObserver(object: self, key: key.rawValue) { (change) in
            //debugPrint(change, change.newValue.debugDescription)
            let typedChange = DefaultsObserver.Change(indexes: change.indexes,
                                                      isPrior: change.isPrior,
                                                      kind: change.kind,
                                                      newValue: change.newValue as? T,
                                                      oldValue: change.oldValue as? T)
            //debugPrint(typedChange)
            changeHandler(typedChange)
        }
        observer.startObservation(options)
        return observer
    }
    
    func observe<T>(key: DefaultsKey<T>, options: NSKeyValueObservingOptions = [], changeHandler: @escaping (_ change: DefaultsObserver.Change<T>) -> Void) -> DefaultsObserver where T:NSSecureCoding {
        let observer = DefaultsObserver(object: self, key: key.rawValue) { (change) in
            //debugPrint(change, change.newValue.debugDescription)
            var oldValue: T?,
                newValue: T?
            if let encoded = change.oldValue as? Data {
               UserDefaults.decode(encoded, &oldValue)
            }
            if let encoded = change.newValue as? Data {
               UserDefaults.decode(encoded, &newValue)
            }
            let typedChange = DefaultsObserver.Change(indexes: change.indexes,
                                                      isPrior: change.isPrior,
                                                      kind: change.kind,
                                                      newValue: newValue,
                                                      oldValue: oldValue)
            //debugPrint(typedChange)
            changeHandler(typedChange)
        }
        observer.startObservation(options)
        return observer
    }

}

final class DefaultsObserver: NSObject {
    
    struct Change<T> {
        let indexes: IndexSet?
        let isPrior: Bool
        let kind: NSKeyValueChange
        let newValue: T?
        let oldValue: T?
    }
    
    private weak var object: UserDefaults?
    private let changeHandler: (Change<Any>) -> Void
    private let key: String
       
    fileprivate init(object: UserDefaults, key: String, changeHandler: @escaping (Change<Any>) -> Void) {
        self.object = object
        self.key = key
        self.changeHandler = changeHandler
    }
    
    deinit {
        self.object?.removeObserver(self, forKeyPath: self.key, context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        //print(className, #function, keyPath ?? "nil", object ?? "nil", change ?? "nil")
        
        guard
            keyPath == self.key,
            let change = change,
            object as? NSObject == self.object
            else { return }
        
        let typedChange = Change(indexes: change[.indexesKey] as! IndexSet?,
                                 isPrior: change[.notificationIsPriorKey] as? Bool ?? false,
                                 kind: NSKeyValueChange(rawValue: change[.kindKey] as! UInt)!,
                                 newValue: change[.newKey],
                                 oldValue: change[.oldKey])
        //debugPrint(typedChange)
        changeHandler(typedChange)
    }
    
    func invalidate() {
        object?.removeObserver(self, forKeyPath: self.key, context: nil)
        object = nil
    }
    
    fileprivate func startObservation(_ options: NSKeyValueObservingOptions) {
        object?.addObserver(self, forKeyPath: self.key, options: options, context: nil)
    }
    
}
