//
//  FilesNode.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-01-31.
//

import Cocoa

class FilesNode: NSObject {
    var displayName: String
    var url: URL?
    
    override init() {
        displayName = "NONE"
        super.init()
        print(className, #function)
    }

    init(from url:URL) {
        self.url = url
        self.displayName = url.lastPathComponent
        super.init()
        self.displayName = localizedName
    }

    // Returns true if this url is a file system container (packages are not considered containers).
    var isBranch: Bool {
        var isFolder = false
        if let resources = try? url?.resourceValues(forKeys: [.isDirectoryKey, .isPackageKey]) {
            let isURLDirectory = resources.isDirectory ?? false
            let isPackage = resources.isPackage ?? false
            isFolder = isURLDirectory && !isPackage
        }
        return isFolder
    }

    lazy var children = getChildren()
    var didGetChilren = false
    
    func getChildren()->[FilesNode]? {
        didGetChilren = true
        if isBranch,
           let sortedContents = try? sortedContentsOfDirectory() {
            return sortedContents.map{FilesNode(from:$0)}
        } else {
            return nil
        }
    }

    fileprivate func compareLastPathComponent(_ a:URL, _ b:URL)->ComparisonResult {
        return a.lastPathComponent.localizedStandardCompare(b.lastPathComponent)
    }
    
    fileprivate func sortedContentsOfDirectory()throws->[URL] {
        let contents = try FileManager.default.contentsOfDirectory(at: url!,
                                                                   includingPropertiesForKeys: FilesNode.referencedValueKeys,
                                                                   options: FilesNode.enumerationOptions)
        let sorted = contents.sorted(by:{ compareLastPathComponent($0, $1) == ComparisonResult.orderedAscending })
        return sorted
    }

    func updateChildren() {
        // ignores update if children have not been loaded
        if isBranch && didGetChilren {
            if let sortedContents = try? sortedContentsOfDirectory() {
                if children == nil {
                    children = sortedContents.map{FilesNode(from:$0)}
                } else {
                    // merge sorted sequences
                    //print(className, #function, url ?? "nil", children?.count ?? "nil", sortedContents.count, terminator:"")
                    var oi = 0, ni = 0
                    while oi < children!.count, ni < sortedContents.count {
                        switch compareLastPathComponent(children![oi].url ?? URL(fileURLWithPath:""),
                                                        sortedContents[ni]) {
                        case .orderedAscending:
                            //print("[-]", children![oi].url?.lastPathComponent ?? "nil", separator:"", terminator:"")
                            children!.remove(at:oi)
                        case .orderedSame:
                            //print(":", sortedContents[ni].lastPathComponent, separator:"", terminator:"")
                            oi += 1; ni += 1
                        case .orderedDescending:
                            //print("[+]", sortedContents[ni].lastPathComponent, separator:"", terminator:"")
                            children!.insert(FilesNode(from:sortedContents[ni]), at:oi)
                            oi += 1; ni += 1
                        }
                    }
                    while oi < children!.count {
                        //print("[-]", children![oi].url?.lastPathComponent ?? "nil", separator:"", terminator:"")
                        children!.remove(at:oi)
                    }
                    while ni < sortedContents.count {
                        //print("[+]", sortedContents[ni].lastPathComponent, separator:"", terminator:"")
                        children!.append(FilesNode(from:sortedContents[ni]))
                        ni += 1
                    }
                    //print()
                }
            } else {
                children = nil
            }
        }
        //print(#function, children?.map{$0.url?.lastPathComponent ?? "nil"} ?? "nil")
    }
    
    func findDescendant(_ path:String)->FilesNode? {
        if let url = url {
            let urlPath = url.hasDirectoryPath ? url.path+"/" : url.path
            if urlPath == path { return self }
            if url.hasDirectoryPath && path.hasPrefix(urlPath) {
                if didGetChilren { // don't descend if never expanded
                    if let children = children {
                        for child in children {
                            if let d = child.findDescendant(path) {
                                return d
                            }
                        }
                    }
                }
            }
        }
        return nil
    }
    
    func findAncestry(_ path:String)->[FilesNode]? {
        // this is used to restore the outline, so children are always loaded
        if let url = url {
            let urlPath = url.hasDirectoryPath ? url.path+"/" : url.path
            if urlPath == path { return [self] }
            if url.hasDirectoryPath && path.hasPrefix(urlPath) {
                if let children = children {
                    for child in children {
                        if let d = child.findAncestry(path) {
                            var a = d
                            a.insert(self, at:0)
                            return a
                        }
                    }
                }
            }
        }
        return nil
    }

    static let enumerationOptions: FileManager.DirectoryEnumerationOptions = [
                                            .skipsHiddenFiles,
                                            //.skipsPackageDescendants,
                                            .skipsSubdirectoryDescendants]

    // Returns true if this URL points to an image file.
    var isImage: Bool {
        var isImage = false
        if let typeIdentifierResource = try? url?.resourceValues(forKeys: [.typeIdentifierKey]) {
            if let imageTypes = CGImageSourceCopyTypeIdentifiers() as? [Any] {
                let typeIdentifier = typeIdentifierResource.typeIdentifier
                for imageType in imageTypes {
                    if UTTypeConformsTo(typeIdentifier! as CFString, imageType as! CFString) {
                        isImage = true
                        break // Done deducing it's an image file.
                    }
                }
            }
        } else if let ext = url?.pathExtension {
            // Can't find the type identifier, check further by extension.
            let imageFormats = ["jpg", "jpeg", "png", "gif", "tiff"]
            isImage = imageFormats.contains(ext)
        }
        return isImage
    }
    
    // Returns the type or UTI.
    var fileTypeID: String {
        var fileType = ""
        if let typeIdentifierResource = try? url?.resourceValues(forKeys: [.typeIdentifierKey]) {
            fileType = typeIdentifierResource.typeIdentifier!
        }
        //print(url?.lastPathComponent, fileType)
        return fileType
    }
    
    var typeExtension: String? {
        return url?.pathExtension
    }
    
    var isHidden: Bool {
        let resource = try? url?.resourceValues(forKeys: [.isHiddenKey])
        return (resource?.isHidden) ?? false
    }
    
    var icon: NSImage {
        var icon: NSImage!
        if let iconValues = try? url?.resourceValues(forKeys: [.customIconKey, .effectiveIconKey]) {
            if let customIcon = iconValues.customIcon {
                icon = customIcon
            } else if let effectiveIcon = iconValues.effectiveIcon as? NSImage {
                icon = effectiveIcon
            }
        } else {
            // Failed to not find the icon from the URL, make a generic one.
            let osType = isBranch ? kGenericFolderIcon : kGenericDocumentIcon
            let iconType = NSFileTypeForHFSTypeCode(OSType(osType))
            icon = NSWorkspace.shared.icon(forFileType: iconType!)
        }
        return icon
    }
    
    func printType() {
        let t = fileTypeID as CFString
        print(className, url?.lastPathComponent ?? "nil", fileTypeID,
//              UTTypeCopyPreferredTagWithClass(t, kUTTagClassMIMEType)?.takeUnretainedValue() ?? "nil",
//              UTTypeCopyPreferredTagWithClass(t, kUTTagClassFilenameExtension)?.takeUnretainedValue() ?? "nil")
              UTTypeCopyDeclaration(t)?.takeUnretainedValue() ?? "nil")
        if UTTypeIsDynamic(t) {
            if let decode = FilesNode.dynamicUTIDecode(t) {
                print(decode)
            }
        }
    }
    
    private static func dynamicUTIDecode(_ typeID:CFString)->String? {
        // https://alastairs-place.net/blog/2012/06/06/utis-are-better-than-you-think-and-heres-why/
        let length = CFStringGetLength(typeID)
        if length > 5,
           CFStringGetCharacterAtIndex(typeID,4) == UnicodeScalar("a").value {
            //https://gist.github.com/jtbandes/19646e7457208ae9b1ad
            //print(typeID)
            let codeChars = Array("abcdefghkmnpqrstuvwxyz0123456789")
            var bits = 0, numBits = 0, bytes = [UInt8]()
            for i in 5..<length {
                if let char = UnicodeScalar(CFStringGetCharacterAtIndex(typeID, i)),
                   let index = codeChars.firstIndex(of:Character(char)) {
                    bits = (bits << 5) | index
                    numBits += 5
                    //print(char, String(index,radix:2), String(bits,radix:2), numBits)
                    if numBits >= 8 {
                        numBits -= 8
                        let b = UInt8(bits >> numBits)
                        bytes.append(b)
                        bits &= (1<<numBits) - 1
                        //print(String(b,radix:16), UnicodeScalar(b), String(bits,radix:2), numBits)
                    }
                } else {
                    print(className, #function, "invalid encoding in dynamic UTType", typeID)
                    return nil
                }
            }
            if bits != 0 {
                print(className, #function, numBits, "excess bits in dynamic UTType", typeID)
                return nil
            }
            let dec = String(decoding:bytes, as:UTF8.self)
            //print(dec)
            let abbrev = [
            /*0*/ "UTTypeConformsTo",
            /*1*/ "public.filename-extension",
            /*2*/ "com.apple.ostype",
            /*3*/ "public.mime-type",
            /*4*/ "com.apple.nspboard-type",
            /*5*/ "public.url-scheme",
            /*6*/ "public.data",
            /*7*/ "public.text",
            /*8*/ "public.plain-text",
            /*9*/ "public.utf16-plain-text",
            /*A*/ "com.apple.traditional-mac-plain-text",
            /*B*/ "public.image",
            /*C*/ "public.video",
            /*D*/ "public.audio",
            /*E*/ "public.directory",
            /*F*/ "public.folder"]
            if dec.starts(with:"?") {
                let NULL = Character("\0")
                var exp = "", p = NULL
                for c in dec {
                    if p == Character("\\") {
                        // escape
                    } else if c == ":" || c == "=" {
                        // expand (TODO ",")
                        if p >= Character("0") && p <= Character("9") {
                            exp.append(abbrev[Int(p.asciiValue!-Character("0").asciiValue!)])
                        } else if p >= Character("A") && p <= Character("F") {
                            exp.append(abbrev[Int(p.asciiValue!-Character("A").asciiValue!)+10])
                        } else if p != NULL {
                            exp.append(p)
                        }
                    } else if p != NULL {
                        exp.append(p)
                    }
                    p = c
                }
                if p != NULL {
                    exp.append(p)
                }
                return exp
            }
            return dec
        } else {
            print(className, #function, "unrecognized encoding in dynamic UTType", typeID)
            return nil
        }
    }
    
    #if XDEBUG
    
    static func dynamicUTIExample(_ s:String) {
        let t = s as CFString
        print(dynamicUTIDecode(t) ?? "nil")
    }
    
    static func dynamicUTIExamples() {
        //https://gist.github.com/jtbandes/19646e7457208ae9b1ad
        dynamicUTIExample("dyn.ah62d4rv4gu8yc6durvwwa3xmrvw1gkdusm1044pxqyuha2pxsvw0e55bsmwca7d3sbwu")  // "?0=6:4=Apple files promise pasteboard type"
        dynamicUTIExample("dyn.ah62d4rv4gu8y6y4usm1044pxqzb085xyqz1hk64uqm10c6xenv61a3k") // "?0=6:4=NSPromiseContentsPboardType"
        dynamicUTIExample("dyn.ah62d46dzqm0gw23srf4gn5m4ge8068dytf2gn3dgrf0gn25tr34gn5xysr2ge55bsmwhk8puqzsdy4xuq6") // "?0=public.item:1=nxtypedfilecontentspboardtype\:jpg"
        dynamicUTIExample("dyn.ah62d4uv4ge804550") // "?0=B:1=mov"
        dynamicUTIExample("dyn.agq80c6durvy0g2pyrf106p5rsa4a") // "3=application/mp4"
        dynamicUTIExample("dyn.ah62d4rv4gu8ykzwynr11n6xdqzngn8dyn3y0n74qqf1gs7pbq7wza2xtqf3gkzd3sbwu") // "?0=6:4=DVTSourceTextViewLanguagePboardType"
        dynamicUTIExample("dyn.ah62d4rv4gu8ykzwynr11n6xdqzngn8dyn3y0n74xqr11a3nqqf1gs7pbq7wyg55ssvw1u7cuqm10c6xenv61a3k") // "?0=6:4=DVTSourceTextViewScopeLanguageContextPboardType"
        dynamicUTIExample("dyn.ah62d4rv4gu8ykzwynr11n6xdqzngn8dyn3y0n74msra1kuwtmvkge55bsmwfk8puqy") // "?0=6:4=DVTSourceTextViewIsAtBOLPboardType"
        dynamicUTIExample("dyn.ah62d4rv4gk81n65yru") // "?0=6:2=ustl"
        dynamicUTIExample("dyn.ah62d4rv4gk81g7d3ru") // "?0=6:2=styl"
    }
    
    #endif
    
    var isViewable: Bool {
        // System-Declared Uniform Type Identifiers
        // https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html#//apple_ref/doc/uid/TP40009259-SW1
        let t = fileTypeID as CFString
        if UTTypeConformsTo(t, kUTTypeDirectory) { return true }
        if UTTypeConformsTo(t, kUTTypeText) { return true }
        if UTTypeEqual(t, kUTTypeData) { return true } // imported Unix files without extensions may be data
        if UTTypeIsDynamic(t) && UTTypeConformsTo(t, kUTTypeData) { return true } // also with extensions
        if UTTypeConformsTo(t, kUTTypePDF) { return true }
        return false
    }
    
    // Returns the human-visible localized name.
    var localizedName: String {
        var localizedName = ""
        if let fileNameResource = try? url?.resourceValues(forKeys: [.localizedNameKey]) {
            localizedName = fileNameResource.localizedName!
        } else {
            // Failed to get the localized name, use it's last path component as the name.
            localizedName = url?.lastPathComponent ?? "NO NAME"
        }
        return localizedName
    }
    
    var fileSize: Int? {
        if let allocatedSizeResource = try? url?.resourceValues(forKeys: [.totalFileAllocatedSizeKey]) {
            return allocatedSizeResource.totalFileAllocatedSize
        }
        return nil
    }
    
    static let sizeFormatter = ByteCountFormatter()
    
    var fileSizeString: String {
        var fileSizeString = "-"
        if FilesNode.sizeFormatter.allowedUnits != .useKB {
            FilesNode.sizeFormatter.countStyle = .file
            FilesNode.sizeFormatter.allowedUnits = .useKB
            FilesNode.sizeFormatter.includesUnit = false
        }
        if let size = fileSize {
            fileSizeString = FilesNode.sizeFormatter.string(fromByteCount:Int64(size))
        }
        return fileSizeString
    }

    var creationDate: Date? {
        var creationDate: Date?
        if let fileCreationDateResource = try? url?.resourceValues(forKeys: [.creationDateKey]) {
             creationDate = fileCreationDateResource.creationDate
        }
        return creationDate
    }
    
    var modificationDate: Date? {
        var modificationDate: Date?
        if let modDateResource = try? url?.resourceValues(forKeys: [.contentModificationDateKey]) {
            modificationDate = modDateResource.contentModificationDate
        }
        return modificationDate
    }
    
    // Returns the localized kind string.
    var kind: String {
        var kind = "-"
        if let kindResource = try? url?.resourceValues(forKeys: [.localizedTypeDescriptionKey]) {
            kind = kindResource.localizedTypeDescription!
        }
        return kind
    }
    
    static let referencedValueKeys: [URLResourceKey] = [
                        .isDirectoryKey,
                        .isPackageKey,
                        .typeIdentifierKey,
                        .isHiddenKey,
                        .customIconKey,
                        .effectiveIconKey,
                        .localizedNameKey,
                        .totalFileAllocatedSizeKey,
                        .creationDateKey,
                        .contentModificationDateKey,
                        .localizedTypeDescriptionKey]
}
