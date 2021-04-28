//
//  FilesView+Outline.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-02-02.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//

import Cocoa

extension FilesViewController: NSOutlineViewDataSource {
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if let node = item as? FilesNode {
            return node.isBranch
        } else {
            return false
        }
    }

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if item == nil {
            return filesTop?.children?.count ?? 0
        } else if let node = item as? FilesNode {
            return node.children?.count ?? 0
        } else {
            return 0
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if item == nil {
            return filesTop?.children?[index] as Any
        } else if let node = item as? FilesNode {
            return node.children?[index] as Any
        } else {
            return filesTop as Any
        }
    }
    
    /** When the outline view is saving the expanded items, this method is called for
        each expanded item, to translate the outline view item to an archived object.
     */
    func outlineView(_ outlineView: NSOutlineView, persistentObjectForItem item: Any?) -> Any? {
        return (item as? FilesNode)?.url?.path
    }
    
    /** When the outline view is restoring the saved expanded items, this method is
        called for each expanded item, to translate the archived object to an outline
        view item.
     */
    func outlineView(_ outlineView: NSOutlineView, itemForPersistentObject object: Any) -> Any? {
        guard let string = object as? String
        else { return nil }
        //print(#function, object)
        // save for later as filesTop is not yet set when this is called
        filesOutlineRestoreExpanded.append(string)
        return nil
    }
}

extension FilesViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        return false // don't highlight branch rows
        //let node = FilesViewController.node(from:item)
        // return node?.isBranch ?? false
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        //print("viewFor", tableColumn?.identifier, (item as? FilesNode)?.url)
        guard let node = item as? FilesNode else { return nil }
        var cellView: NSTableCellView?
        if let tableColumn = tableColumn {
            cellView = outlineView.makeView(withIdentifier:tableColumn.identifier, owner:self) as? NSTableCellView
            switch tableColumn {
            case filesNameColumn:
                cellView?.textField?.stringValue = node.displayName
                if !node.isBranch {
//                    cellView?.imageView?.image = node.icon
                }
                //cellView?.textField?.isEditable = TODO
            case filesTypeColumn:
                if !node.isBranch {
                    cellView?.textField?.stringValue = node.typeExtension ?? "" // node.kind
                } else {
                    cellView?.textField?.stringValue = ""
                }
            case filesSizeColumn:
                if !node.isBranch {
                    cellView?.textField?.stringValue = node.fileSizeString
                } else {
                    cellView?.textField?.stringValue = ""
                }
            default:
                break
            }
            cellView?.textField?.textColor = node.isViewable ? .controlTextColor : .disabledControlTextColor
        } else { // group row if enabled by outlineView(_:isGroupItem:)
            cellView = outlineView.makeView(withIdentifier:filesNameColumn.identifier, owner:self) as? NSTableCellView
            cellView?.textField?.stringValue = node.displayName
        }
        return cellView
    }
    
    // Handling Selection
    
    /// Returns a Boolean value that indicates whether the outline view should select a given table column.
    func outlineView(_ outlineView:NSOutlineView, shouldSelect: NSTableColumn?) -> Bool {
        return false
    }

    func outlineView(_ outlineView: NSOutlineView, shouldSelectItem item: Any) -> Bool {
        if let node = item as? FilesNode,
           !node.isBranch {
            if node.isViewable { return true }
            node.printType()
        }
        return false
    }
       
    /// Invoked to allow the delegate to modify the proposed selection.
    //func outlineView(_ outlineView:NSOutlineView, selectionIndexesForProposedSelection: IndexSet) -> IndexSet
    /// Returns a Boolean value that indicates whether the outline view should change its selection.
    //func selectionShouldChange(in: NSOutlineView) -> Bool
    /// Invoked when notification is posted—that is, whenever the outline view’s selection changes.
    //func outlineViewSelectionIsChanging(Notification)
    /// Invoked when the selection did change notification is posted—that is, immediately after the outline view’s selection has changed.
    //func outlineViewSelectionDidChange(_ notification:Notification) {

    // Editing Items
    
    /// Returns a Boolean value that indicates whether the outline view should allow editing of a given item in a given table column.
    //func outlineView(NSOutlineView, shouldEdit: NSTableColumn?, item: Any) -> Bool

}


