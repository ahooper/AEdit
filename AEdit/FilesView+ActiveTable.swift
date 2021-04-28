//
//  FilesView+ActiveTable.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-02-02.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//

import Cocoa

extension FilesViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return documentsTabView.tabViewItems.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return documentsTabView.tabViewItems[row]
    }

}

extension FilesViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard documentsTabView.tabViewItems.indices.contains(row)
        else {
            Swift.print(className, #function, "row index", row, "range", documentsTabView.tabViewItems.indices)
            return nil
        }
        if tableColumn == activeNameColumn {
            let cellView = tableView.makeView(withIdentifier:tableColumn!.identifier, owner:self) as! NSTableCellView
            if row < documentsTabView.tabViewItems.count {
                let item = documentsTabView.tabViewItems[row]
                cellView.objectValue = item
                cellView.textField?.stringValue = item.label
                //print(cellView.subviews)
                // let button = cellView.subviews[1] as? NSButton
            } else {
                cellView.textField?.stringValue = "Out of bounds \(row)"
            }
            return cellView
        }
        return nil
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        // https://stackoverflow.com/a/9594543
        return HighlightTableRowView()
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
        //TODO maybe should be in window controller
        //print(self.className, #function, notification.object)
        if let tableView = notification.object as? NSTableView {
            //print(self.className, #function, "row", tableView.selectedRow, "column", tableView.selectedColumn)
            if tableView.selectedRow >= 0 && tableView.selectedRow < documentsTabView.tabViewItems.count {
                let item = documentsTabView.tabViewItems[tableView.selectedRow]
                documentsTabView.selectTabViewItem(item)
            }
        }
    }

}

class HighlightTableRowView: NSTableRowView {
    // https://stackoverflow.com/a/39794881

    override func drawSelection(in dirtyRect: NSRect) {
        let primaryColor = NSColor.alternateSelectedControlColor.withAlphaComponent(0.5)
        let secondarySelectedControlColor = NSColor.secondarySelectedControlColor.withAlphaComponent(0.5)
        
        switch selectionHighlightStyle {
        case .regular:
            if isSelected {
                if isEmphasized {
                    primaryColor.set()
                } else {
                    secondarySelectedControlColor.set()
                }
            }
            //https://stackoverflow.com/a/50663555
            var rects: UnsafePointer<NSRect>?
            var count = 0
            getRectsBeingDrawn(&rects, count:&count)
            for i in 0..<count {
                let rect = NSIntersectionRect(bounds, rects![i])
                rect.fill(using:.sourceOver)
            }
        default:
            super.drawSelection(in: dirtyRect)
        }
    }
}

extension FilesViewController: NSTabViewDelegate {
    
    func tabView(_ tabView: NSTabView, didSelect tabViewItem: NSTabViewItem?) {
        //print(self, #function, tabViewItem?.identifier ?? "nil")
        //TODO probably should be in window controller
        if let windowController = windowController {
            if let previousDocument = windowController.document as? NSDocument {
                previousDocument.removeWindowController(windowController)
            }
            if let viewable = tabViewItem?.identifier as? ViewableDocument {
                viewable.addWindowController(windowController)
            } else {
                print(self, #function, tabViewItem?.identifier ?? "nil")
            }
            if let itemView: NSView = tabViewItem?.view,
               let acceptingSubview = itemView.subviews.first(where:{$0.acceptsFirstResponder}) {
                windowController.window?.makeFirstResponder(acceptingSubview)
            }
        } else {
            print(self, #function, tabViewItem?.identifier ?? "nil")
        }
    }

}
