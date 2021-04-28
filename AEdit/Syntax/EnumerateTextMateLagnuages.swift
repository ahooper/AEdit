//
//  LoadTextMateLanguages.swift
//  AEdit
//
//  Created by Andy Hooper on 2020-11-21.
//  Copyright © 2020 Andy Hooper. All rights reserved.
//

//  https://macromates.com/manual/en/language_grammars

import Foundation

class LoadTextMateLanguages {
    
    init() {
        let textmateLibrary = NSHomeDirectory().appending("/Library/Application Support/TextMate")
        let enumerator = FileManager.default.enumerator(atPath: textmateLibrary)
        // https://stackoverflow.com/a/42167391/302852
        var foundFormat = PropertyListSerialization.PropertyListFormat.binary
        while let file = enumerator?.nextObject() as? String {
            if file.hasSuffix(".plist") && file.contains("/Syntaxes/") {
                if let data = FileManager.default.contents(atPath: textmateLibrary.appending("/").appending(file)),
                    let dict = try? PropertyListSerialization.propertyList(from: data,
                                                                           options: [],
                                                                           format: &foundFormat)
                        as? [String : AnyObject] {
                    print(dict["name"], dict["scopeName"], dict["fileTypes"])
                }
            } else if file.hasSuffix(".tmTheme") && file.contains("/Themes/") {
                if let data = FileManager.default.contents(atPath: textmateLibrary.appending("/").appending(file)),
                   let dict = try? PropertyListSerialization.propertyList(from: data,
                                                                          options: [],
                                                                          format: &foundFormat)
                                                                as? [String : AnyObject] {
                    print(dict["name"])
                }
            }
        }
        
    }
}
