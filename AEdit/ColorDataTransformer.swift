//
//  ColorDataTransformer.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-03-01.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//

import Foundation
import AppKit.NSColor

class SecureCodingTransformer<T>: ValueTransformer where T:NSSecureCoding {
    
    override class func transformedValueClass() -> AnyClass {
        return T.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        true
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        //print(className, #function, value.debugDescription)
        if let encoded = value as? Data {
            var decoded: T?
            UserDefaults.decode(encoded, &decoded)
            //print(className, #function, key, decoded)
            return decoded
        } else if value == nil {
            return nil
        }
        print(className, #function, "Unexpected value", value.debugDescription)
        return nil
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        //print(className, #function, value.debugDescription)
        if let value = value as? T {
            let encoded = UserDefaults.encode(value)
            //debugPrint(encoded)
            return encoded
        } else if value == nil {
            return nil
        }
        print(className, #function, "Unexpected value", value.debugDescription)
        return nil
    }

}

class ColorDataTransformer: SecureCodingTransformer<NSColor> {

    static let name = NSValueTransformerName(rawValue: "ColorDataTransformer")
    
}
