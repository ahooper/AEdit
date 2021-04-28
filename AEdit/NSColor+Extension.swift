//
//  NSColor+Extension.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-03-09.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//

import Cocoa

extension NSColor {
    /* Crude attempt, for more see
     https://thoughtbot.com/blog/closer-look-color-lightness
     http://alienryderflex.com/hsp.html
     https://github.com/thisandagain/color
     http://www.easyrgb.com/en/math.php
     https://gist.github.com/ngquerol/23d6d5ebd051e18682badafa37e48442
     https://github.com/bennyguitar/Colours
     */
    func getBrightness()->CGFloat? {
        if let brightness = self.usingType(.componentBased)?.brightnessComponent {
            return brightness
        }
        return nil
    }
    
    func shiftBrightness(byDifference:CGFloat)->NSColor {
        var hue = CGFloat.nan, saturation = CGFloat.nan, brightness = CGFloat.nan, alpha = CGFloat.nan
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return NSColor(calibratedHue: hue, saturation: saturation, brightness: brightness+byDifference, alpha: alpha)
    }
    
    #if DEBUG
    func print() {
        Swift.print(self, "=>", self.usingType(.componentBased) ?? "nil")
    }   
    static func printUIColours() {
        labelColor.print()
        secondaryLabelColor.print()
        tertiaryLabelColor.print()
        quaternaryLabelColor.print()
        linkColor.print()
        placeholderTextColor.print()
        windowFrameTextColor.print()
        selectedMenuItemTextColor.print()
        alternateSelectedControlTextColor.print()
        headerTextColor.print()
        separatorColor.print()
        gridColor.print()
        windowBackgroundColor.print()
        underPageBackgroundColor.print()
        controlBackgroundColor.print()
        selectedContentBackgroundColor.print()
        unemphasizedSelectedContentBackgroundColor.print()
        _=alternatingContentBackgroundColors.map{$0.print()}
        findHighlightColor.print()
        textColor.print()
        textBackgroundColor.print()
        selectedTextColor.print()
        selectedTextBackgroundColor.print()
        unemphasizedSelectedTextBackgroundColor.print()
        unemphasizedSelectedTextColor.print()
        controlColor.print()
        controlTextColor.print()
        selectedControlColor.print()
        selectedControlTextColor.print()
        disabledControlTextColor.print()
        keyboardFocusIndicatorColor.print()
        controlAccentColor.print()
        highlightColor.print()
        shadowColor.print()
        controlHighlightColor.print()
    }
    #endif
}
