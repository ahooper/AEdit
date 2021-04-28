//
//  PreferencesViewController.swift
//  AEdit
//
//  Created by Andy Hooper on 2020-10-17.
//  Copyright © 2020 Andy Hooper. All rights reserved.
//

import Cocoa

class PreferencesViewController: NSViewController {

    @IBOutlet weak var fontPreview: NSTextFieldCell!
    @IBOutlet weak var lineSpacingValue: NSTextField!
    @IBOutlet weak var backgroundColourWell: NSColorWell!
    @IBOutlet weak var textColourWell: NSColorWell!
    @IBOutlet weak var commentColourWell: NSColorWell!
    @IBOutlet weak var literalColourWell: NSColorWell!
    @IBOutlet weak var keywordColourWell: NSColorWell!
    @IBOutlet weak var preprocessorColourWell: NSColorWell!
    @IBOutlet weak var typenameColourWell: NSColorWell!
    
    var backgroundObserver: DefaultsObserver?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFont()
        lineSpacingValue.doubleValue = Defaults[.lineSpacing].native
        backgroundObserver = Defaults.observe(key:.backgroundColour, options:[.new]) { update in
            //print(self.className, "observe backgroundColour", update.newValue ?? "NIL")
            if let colour = update.newValue {
                self.fontPreview.backgroundColor = colour
            }
        }

    }
    
    @IBAction func selectFont(_ sender: Any) {
        let fontManager = NSFontManager.shared
        fontManager.orderFrontFontPanel(sender)
        fontManager.target = self
    }
      
    override func viewDidDisappear() {
        //print(self.className, #function, "lineSpacing", Defaults[.lineSpacing])
    }

    override func viewWillDisappear() {
        super.viewWillDisappear()
        if NSFontManager.shared.target === self {
            NSFontManager.shared.target = nil
            if NSFontPanel.shared.isVisible { NSFontPanel.shared.orderOut(nil) }
        }
        if NSColorPanel.shared.isVisible { NSColorPanel.shared.orderOut(nil) }
    }

}

extension PreferencesViewController: NSFontChanging {
    
    func validModesForFontPanel(_ fontPanel: NSFontPanel) -> NSFontPanel.ModeMask {
        return [.collection, .size]
    }
    
    func changeFont(_ sender: NSFontManager?) {
        guard let sender = sender else { return }
        let newFont = sender.convert(.systemFont(ofSize: 0))
        Defaults[.fontName] = newFont.fontName
        Defaults[.fontSize] = newFont.pointSize
        //print("changeFont", newFont.fontName, newFont.pointSize)
        setupFont()
    }
    
    func setupFont() {
        if let name = Defaults[.fontName] {
            let size = Defaults[.fontSize]
            let maxDisplaySize = NSFont.systemFontSize(for:.regular) * 2
            guard
                let font = NSFont(name:name, size:size),
                let displayFont = NSFont(name:name, size:min(size, maxDisplaySize))
                else { return }
            let displayName = font.displayName ?? font.fontName
            fontPreview.stringValue = displayName + " " + String.localizedStringWithFormat("%g", font.pointSize)
            fontPreview.font = displayFont
            NSFontManager.shared.setSelectedFont(font, isMultiple:false)
            //print("setupFont", font.fontName, font.pointSize)
        }
    }
    
}
