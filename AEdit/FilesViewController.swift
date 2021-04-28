//
//  FilesViewController.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-01-31.
//

import Cocoa

class FilesViewController: NSViewController {
    
    static let LARGE_FILE_WARNING_SIZE = 1_000_000

    @IBOutlet weak var activeFilesScroll: NSScrollView!
    @IBOutlet weak var activeFilesTableView: NSTableView!
    @IBOutlet weak var activeNameColumn: NSTableColumn!
    @IBOutlet weak var activeFilesHeader: NSTableHeaderView!
    
    @IBOutlet weak var filesOutlineScroll: NSScrollView!
    @IBOutlet weak var filesOutlineView: NSOutlineView!
    @IBOutlet weak var filesOutlineHeader: NSTableHeaderView!
    var filesTop: FilesNode?
    var topName: String = ""
    @IBOutlet var filesOutlineContextMenu: NSMenu!
    
    @IBOutlet weak var filesNameColumn: NSTableColumn!
    @IBOutlet weak var filesTypeColumn: NSTableColumn!
    @IBOutlet weak var filesSizeColumn: NSTableColumn!
    
    @IBOutlet weak var navigationSplit: NSSplitView!
    
    @IBOutlet weak var documentsTabView: NSTabView!
    
    var backgroundObserver: DefaultsObserver? // have to assign to retain observers
    
    var filesOutlineRestoreExpanded = [String]() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filesOutlineView.delegate = self
        filesOutlineView.dataSource = self
        filesSizeColumn.headerCell.alignment = .right //TODO doesn't work
        filesOutlineContextMenu.delegate = self
        filesOutlineContextMenu.autoenablesItems = false
        outlineContextOpenWithMenuItem.submenu?.delegate = self
        
        activeFilesTableView.dataSource = self
        activeFilesTableView.delegate = self
 
        documentsTabView.delegate = self
        
        if let backgroundColour = Defaults[.backgroundColour] {
            setControlsBackground(backgroundColour)
        }
        backgroundObserver = Defaults.observe(key:.backgroundColour, options:[.new]) { update in
            //print(self.className, "observe backgroundColour", update.newValue ?? "nil")
            if let colour = update.newValue {
                self.setControlsBackground(colour)
            }
        }
        
        filesOutlineView.autosaveExpandedItems = true // no setting in Interface Builder
        // at this point the restoration list of expanded nodes is loaded

        // https://stackoverflow.com/a/45947198
        //Swift.print(view.perform(Selector(("_subtreeDescription"))))
        #if XDEBUG
        //NSColor.printUIColours()
        #endif
    }

    fileprivate func setControlsBackground(_ backgroundColour: NSColor) {
        //if let controlBackground = backgroundColour.blended(withFraction:0.8, of:.controlBackgroundColor) {
        //if let brightnessDifference = NSColor.underPageBackgroundColor.brigthnessDifference(from: NSColor.textBackgroundColor) {
        if let backgroundBrightness = backgroundColour.getBrightness() {
            let shift = CGFloat((backgroundBrightness > 0.5) ? -0.05 : +0.05)
            let controlBackground = backgroundColour.shiftBrightness(byDifference:shift)
            //print(className, #function, backgroundColour, shift, controlBackground, controlBackground.getBrightness())
//            filesOutlineView.backgroundColor = controlBackground
//            activeFilesTableView.backgroundColor = controlBackground
        }
    }

    var windowController: FilesWindowController?
    
    override func viewWillAppear() {
        documentsTabView.removeTabViewItem(documentsTabView.tabViewItem(at:0)) // remove dummy tab
        activeFilesTableView.reloadData()
        updateActiveFilesTableSize()
        
        if !filesOutlineRestoreExpanded.isEmpty {
            for path in filesOutlineRestoreExpanded {
                //print(#function, path)
                if let ancestry = filesTop?.findAncestry(path+"/") {
                    //print(ancestry.map{$0.url})
                    _ = ancestry.map{filesOutlineView.expandItem($0)}
                }
            }
        }
        filesOutlineRestoreExpanded.removeAll()

        // save windowController for opening documents
        windowController = view.window?.windowController as? FilesWindowController
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(FilesViewController.filesSelectionDidChange(_:)),
                                               name: NSOutlineView.selectionDidChangeNotification,
                                               object: filesOutlineView)
    }

    override func viewWillDisappear() {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSOutlineView.selectionDidChangeNotification,
                                                  object: filesOutlineView)
    }
    
    override var representedObject: Any? {
        didSet {
            if let filesDocument = representedObject as? FilesDocument {
                //print(className, #function, filesDocument.fileURL ?? "nil")
                filesTop = FilesNode(from:filesDocument.fileURL!)
                filesOutlineView.reloadData()
                topName = filesTop?.displayName ?? "UNKNOWN"
                filesNameColumn?.title = topName
                view.window?.title = topName
                
                createMonitor(filesDocument.fileURL!)
            } else {
                print(self, #function, representedObject ?? "nil")
            }
        }
    }
    
    var fsMonitor: FilesMonitor?
    
    deinit {
        fsMonitor = nil
    }
    
    private func createMonitor(_ url:URL) {
        fsMonitor = FilesMonitor(url.path)
        fsMonitor?.callbacks.append({ [self] (eventFlags,path) in
            if let d = filesTop!.findDescendant(path) {
                //print(className, "FilesMonitor", FilesMonitor.flagsDescription(eventFlags), path, d)
                updateOutlineView(d)
            }
        })
    }

    fileprivate func updateOutlineView(_ d: FilesNode) {
        d.updateChildren()
        if d === filesTop {
            //print("filesTop")
            filesOutlineView.reloadData()
        } else {
            //let row = filesOutlineView.row(forItem: d as Any)
            //if row < 0 {
            //    for i in 0..<filesOutlineView.numberOfChildren(ofItem:nil) {
            //        print(i, filesOutlineView.child(i, ofItem:nil) ?? "nil")
            //    }
            //}
            filesOutlineView.reloadItem(d, reloadChildren:true)
        }
    }

    func updateActiveFilesTableSize() {
        activeFilesScroll.needsLayout = true
        activeFilesScroll.layoutSubtreeIfNeeded()
        let lastRowRect = activeFilesTableView.rect(ofRow: activeFilesTableView.numberOfRows-1)
        //Swift.print(self.className, #function, "last row", lastRowRect, "origin", activeFilesScroll.contentView.bounds.origin)
        let oldScrollFrame = activeFilesScroll.frame
        let headerHeight = -activeFilesScroll.contentView.bounds.minY
        let newScrollFrame = NSRect(x: oldScrollFrame.minX,
                                    y: oldScrollFrame.minY,
                                    width: oldScrollFrame.width,
                                    height: min(lastRowRect.maxY + headerHeight,
                                                navigationSplit.maxPossiblePositionOfDivider(at: 0)*0.67))
        //Swift.print(self.className, #function, oldScrollFrame, newScrollFrame)
        activeFilesScroll.frame = newScrollFrame
        navigationSplit.setPosition(newScrollFrame.height, ofDividerAt: 0)
    }
   
    func addDocumentTab(_ document: NSDocument?) {
        guard let viewable = document as? ViewableDocument
        else {
            return assertionFailure("document class not recognized \(document?.className ?? "NIL")")
        }
        let addedViewController = viewable.makePrimaryViewController()
        let tabItem = NSTabViewItem(viewController:addedViewController)
        tabItem.identifier = document
        tabItem.label = document?.fileURL?.lastPathComponent ?? "Untitled" //TODO observer
        if let initialFirstResponder = (addedViewController as? TextDocumentViewController)?.initialFirstResponder {
            //TODO make a superclass or protocol
            tabItem.initialFirstResponder = initialFirstResponder
        }
        documentsTabView.addTabViewItem(tabItem)
        //print(self.className, #function, documentsTabView.tabViewItems)
        documentsTabView.selectTabViewItem(tabItem)
        activeFilesTableView.insertRows(at:[documentsTabView.tabViewItems.count-1], withAnimation:[])
        activeFilesTableView.selectRowIndexes([documentsTabView.tabViewItems.count-1], byExtendingSelection:false)
        updateActiveFilesTableSize()
        view.window?.makeKeyAndOrderFront(self)
    }
    
    func showDocument(_ document: NSDocument) {
        let index = documentsTabView.indexOfTabViewItem(withIdentifier: document)
        if index != NSNotFound {
            documentsTabView.selectTabViewItem(at: index)
        } else {
            addDocumentTab(document)
        }
    }

    func removeDocumentTab(_ document: NSDocument?) {
        guard let document = document else { return }
        let index = documentsTabView.indexOfTabViewItem(withIdentifier: document)
        if index != NSNotFound {
            if documentsTabView.selectedTabViewItem == documentsTabView.tabViewItems[index] {
                if index > 0 { documentsTabView.selectPreviousTabViewItem(self) }
                else { documentsTabView.selectNextTabViewItem(self) }
            }
            documentsTabView.removeTabViewItem(documentsTabView.tabViewItem(at: index))
        } else {
            print(className, #function, "not found", document)
        }
        if let wc = view.window?.windowController {
            document.removeWindowController(wc) // no action if not on list
        }
        activeFilesTableView.removeRows(at:[index], withAnimation:[])
        if let selectedTabItem = documentsTabView.selectedTabViewItem,
           let selectedTabIndex = documentsTabView.tabViewItems.firstIndex(of: selectedTabItem) {
            activeFilesTableView.selectRowIndexes([selectedTabIndex], byExtendingSelection:false)
        }
        updateActiveFilesTableSize()
    }
    
    func activeDocuments()->[NSDocument] {
        return documentsTabView.tabViewItems.map{$0.identifier as! NSDocument}
    }
    
    @IBAction func activeTableAction (_ sender: Any?) {
        //Swift.print(className, #function, activeTable.clickedRow)
        guard let indexSelected = activeFilesTableView.selectedRowIndexes.first // assumes single selection
         else { return }
        if documentsTabView.tabViewItems.indices.contains(indexSelected) {
            documentsTabView.selectTabViewItem(at:indexSelected)
        }
    }
    
    @objc func filesSelectionDidChange(_ notification:Notification) {
        //print(className, #function)
        let item = filesOutlineView.item(atRow: filesOutlineView.selectedRow)
        if let node = item as? FilesNode,
           let url = node.url {
            if (node.fileSize ?? 0) >= FilesViewController.LARGE_FILE_WARNING_SIZE {
                let alert = NSAlert()
                alert.alertStyle = .warning
                alert.messageText = "Large file warning"
                alert.informativeText = "The file “\(url.lastPathComponent ?? "Untitled")” has a size of \(node.fileSizeString) KB. Are you sure you want to open it as a text file?"
                alert.addButton(withTitle: "Open")
                alert.addButton(withTitle: "Cancel")
                switch alert.runModal() {
                case .alertFirstButtonReturn: // Open
                    break
                case .alertSecondButtonReturn: // Cancel
                    return
                default:
                    return
                }

            }
            windowController?.open(url)
        }
    }
    
    @IBAction func closeActiveFileButton(_ sender: Any) {
        // https://stackoverflow.com/a/47572180
        let row = activeFilesTableView.row(for:sender as! NSButton)
        guard
            let cellView = activeFilesTableView.view(atColumn:0, row:row, makeIfNecessary:false) as? NSTableCellView,
            let tabItem = cellView.objectValue as? NSTabViewItem,
            let document = tabItem.identifier as? NSDocument
        else { return }
        //print(self.className, #function, sender, row, tabItem, document.fileURL ?? "NIL")
        document.canClose(withDelegate: self,
                          shouldClose: #selector(canCloseCompletion(_:shouldClose:contextInfo:)),
                          contextInfo: Unmanaged<FilesViewController>.passRetained(self).toOpaque())
        // passRetained is balanced by takeRetainedValue called once in canCloseCompletion
        // https://www.mikeash.com/pyblog/friday-qa-2017-08-11-swiftunmanaged.html
    }
    
    @objc func canCloseCompletion(_ document: NSDocument?, shouldClose: Bool, contextInfo: UnsafeMutableRawPointer?) {
        let filesViewController = Unmanaged<FilesViewController>.fromOpaque(contextInfo!).takeRetainedValue()
        //print(#function, shouldClose, document?.fileURL?.path ?? "NIL", document?.windowControllers ?? "nil")
        if shouldClose,
           let document = document {
            // remove document windowController before closing so window won't be closed
            for windowController in document.windowControllers {
                //print(className, #function, "windowController", windowController)
                document.removeWindowController(windowController)
            }
            document.close()
            DocumentController.shared.removeDocument(document)
            (filesViewController.view.window?.windowController as? FilesWindowController)?.removeDocument(document)
            //TODO if last, add an untitled
        }
        //instrumentObjcMessageSends(on:true)
    }
    
    /// Outline context menu
    
    @IBAction func outlineContextNewFile(_ sender:NSMenuItem) {
    }
    
    @IBAction func outlineContextNewDirectory(_ sender:NSMenuItem) {
    }
    
    @IBOutlet weak var outlineContextOpenWithDefault: NSMenuItem!
    
    fileprivate func applicationNameForMenu(_ applicationURL: URL) -> String {
        return applicationURL.deletingPathExtension().lastPathComponent
    }
    
    fileprivate func updateOpenWithDefault(_ url: URL?) {
        if let url = url,
           let defaultAppURL = LSCopyDefaultApplicationURLForURL(url as CFURL, .all, nil)?.takeRetainedValue() as URL? {
            let name = applicationNameForMenu(defaultAppURL)
            outlineContextOpenWithDefault.title = "Open With "+name
            //outlineContextOpenWithDefault.isEnabled = true
        } else {
            outlineContextOpenWithDefault.title = "Open With Choose Application"
            //outlineContextOpenWithDefault.isEnabled = false
        }
    }
    
    @IBAction func outlineContextOpenWithDefault(_ sender:NSMenuItem) {
        if let url = outlineClickedURL() {
            if !NSWorkspace.shared.open(url) {
                print(className, #function, "Unable to open application for", url)
            }
        }
    }
    
    @IBOutlet weak var outlineContextOpenWithMenuItem: NSMenuItem!
    
    fileprivate func updateOpenWithMenu(_ url: URL?, _ menu:NSMenu) {
        menu.removeAllItems()
        outlineContextOpenWithMenuItem.representedObject = url
        guard let url = url else { return }
        // https://github.com/karaggeorge/mac-open-with/blob/master/Sources/open-with/OpenWith.swift
        // https://github.com/TipuSultan01/dotphoton/blob/master/DotphotonCompress/ThumbnailView/RawImagesCollectionViewContextMenu.swift
        let applicationURLs = LSCopyApplicationURLsForURL(url as CFURL, .all)?.takeRetainedValue() as? [URL]
        if applicationURLs == nil || applicationURLs!.count == 0 {
            menu.addItem(NSMenuItem(title:"No Suitable Applications Found", action:nil, keyEquivalent:String()))
            return
        }
        let defaultAppURL = LSCopyDefaultApplicationURLForURL(url as CFURL, .all, nil)?.takeRetainedValue() as URL?
        //print(className, #function, defaultAppURL ?? "nil", applicationURLs ?? "nil")
        if let defaultAppURL = defaultAppURL {
            menu.addItem(menuItemForApplication(defaultAppURL, suffix:" (default)"))
            if applicationURLs != nil && applicationURLs!.count > 1 {
                menu.addItem(NSMenuItem.separator())
            }
        }
        if let applicationURLs = applicationURLs {
            for appURL in applicationURLs {
                if appURL != defaultAppURL {
                    menu.addItem(menuItemForApplication(appURL))
                }
            }
        }
    }
    
    private func menuItemForApplication(_ applicationURL:URL, suffix:String="")->NSMenuItem {
        let name = applicationNameForMenu(applicationURL)
        let item = NSMenuItem(title:name+suffix, action:#selector(openWithSelectedApplication), keyEquivalent:String())
        item.image = NSWorkspace.shared.icon(forFile:applicationURL.path)
        item.image?.size = CGSize(width: 16, height: 16) // Images are too big by default
        item.target = self
        item.representedObject = applicationURL
        return item
    }
    
    @IBAction func openWithSelectedApplication(_ sender:NSMenuItem) {
        if let applicationURL = sender.representedObject as? URL,
           let fileURL = outlineContextOpenWithMenuItem.representedObject as? URL {
            //print(className, #function, sender.title, applicationURL, fileURL)
            NSWorkspace.shared.open([fileURL],
                                    withApplicationAt:applicationURL,
                                    configuration:NSWorkspace.OpenConfiguration())
                { (runningApplication:NSRunningApplication?, error:Error?) in
                    if let error = error {
                        print(self.className, #function, applicationURL, error)
                    }
                }
        }
    }

    @IBAction func outlineContextDuplicate(_ sender:NSMenuItem) {
        if let url = outlineClickedURL() {
            NSWorkspace.shared.duplicate([url]) { (urls, error) in
                if let error = error {
                    print(self.className, #function, urls, error)
                }
            }
        }
    }
    
    @IBAction func outlineContextRename(_ sender:NSMenuItem) {
    }
    
    @IBAction func outlineContextMoveToTrash(_ sender:NSMenuItem) {
        if let node = outlineClickedNode(),
           let url = node.url {
            NSWorkspace.shared.recycle([url]) { (urls, error) in
                if let error = error {
                    print(self.className, #function, urls, error)
                }
            }
        }
    }
    
    @IBAction func outlineContextRevealInFinder(_ sender:NSMenuItem) {
        if let url = outlineClickedURL() {
            NSWorkspace.shared.activateFileViewerSelecting([url])
        }
    }
    
    private func outlineClickedNode()->FilesNode? {
        let row = filesOutlineView.clickedRow
        return filesOutlineView.item(atRow:row) as? FilesNode
    }
    
    private func outlineClickedURL()->URL? {
        return outlineClickedNode()?.url
    }

    @IBAction func outlineContextCopyFullPath(_ sender:NSMenuItem) {
        if let url = outlineClickedURL() {
            let pasteboard = NSPasteboard.general
            pasteboard.clearContents()
            pasteboard.writeObjects([url.path as NSPasteboardWriting])
        }
    }

}

extension FilesViewController: NSMenuDelegate {
    
    func menuNeedsUpdate(_ menu: NSMenu) {
        //print(className, #function, menu.title)
        if menu === filesOutlineContextMenu {
            let url = outlineClickedURL()
            updateOpenWithDefault(url)
        } else if menu === outlineContextOpenWithMenuItem.submenu {
            let url = outlineClickedURL()
            updateOpenWithMenu(url, menu)
        }
    }

}
