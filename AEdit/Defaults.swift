//
//  Defaults.swift
//  AEdit
//
//  Created by Andy Hooper on 2020-10-17.
//  Copyright © 2020 Andy Hooper. All rights reserved.
//

import Foundation
import Cocoa

public let Defaults = UserDefaults.standard

extension DefaultsKeys {
    static let windowHeight         = DefaultsKey<CGFloat>("windowHeight")
    static let windowWidth          = DefaultsKey<CGFloat>("windowWidth")
    static let fontName             = DefaultsKey<String>("fontName")
    static let fontSize             = DefaultsKey<CGFloat>("fontSize")
    static let lineSpacing          = DefaultsKey<CGFloat>("lineSpacing")
    static let showInvisibles       = DefaultsKey<Bool>("showInvisibles")
    static let tabInterval          = DefaultsKey<Int>("tabInterval")
    static let backgroundColour     = DefaultsKey<NSColor>("backgroundColour")
    static let textColour           = DefaultsKey<NSColor>("textColour")
    static let commentColour        = DefaultsKey<NSColor>("commentColour")
    static let literalColour        = DefaultsKey<NSColor>("literalColour")
    static let keywordColour        = DefaultsKey<NSColor>("keywordColour")
    static let preprocessorColour   = DefaultsKey<NSColor>("preprocessorColour")
    static let typenameColour       = DefaultsKey<NSColor>("typenameColour")
    static let outlineViewFontSize  = DefaultsKey<CGFloat>("outlineViewFontSize")
}

struct DefaultsSettings {
    private static let defaultFont = (NSFont.userFixedPitchFont(ofSize:0) ?? NSFont.systemFont(ofSize:0))!
    private static let colorTransformer = ColorDataTransformer() //TODO this is clumsy

    static let defaults: [DefaultsKeys:Any] = [
        .windowHeight         : 900,
        .windowWidth          : 1200,
        .fontName             : defaultFont.fontName,
        .fontSize             : defaultFont.pointSize,
        .lineSpacing          : 1.2,
        .showInvisibles       : false,
        .tabInterval          : 4,
        .backgroundColour     : colorTransformer.reverseTransformedValue(NSColor.textBackgroundColor)!,
        .textColour           : colorTransformer.reverseTransformedValue(NSColor.textColor)!,
        .commentColour        : colorTransformer.reverseTransformedValue(NSColor(red:0, green:0.5, blue:0, alpha:1).blended(withFraction:0.4, of:.black)!)!,
        .literalColour        : colorTransformer.reverseTransformedValue(NSColor.red.blended(withFraction:0.4, of:.black)!)!,
        .keywordColour        : colorTransformer.reverseTransformedValue(NSColor.purple.blended(withFraction:0.4, of:.black)!)!,
        .preprocessorColour   : colorTransformer.reverseTransformedValue(NSColor.brown.blended(withFraction:0.4, of:.black)!)!,
        .typenameColour       : colorTransformer.reverseTransformedValue(NSColor.blue.blended(withFraction:0.4, of:.black)!)!,
        .outlineViewFontSize  : NSFont.smallSystemFontSize,
    ]
    
    private init() { }
}

// CotEditor-3.8.9/CotEditor/Sources/Collection.swift
extension Dictionary {
    
    /// Return a new dictionary containing the keys transformed by the given closure with the values of this dictionary.
    ///
    /// - Parameter transform: A closure that transforms a key. Every transformed key must be unique.
    /// - Returns: A dictionary containing transformed keys and the values of this dictionary.
    func mapKeys<T>(transform: (Key) throws -> T) rethrows -> [T: Value] {
        
        let keysWithValues = try self.map { (key, value) -> (T, Value) in
             (try transform(key), value)
        }
        
        return [T: Value](uniqueKeysWithValues: keysWithValues)
    }
    
}
