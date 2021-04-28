//
//  PrintObjectData.swift
//  AEdit
//
//  Created by Andy Hooper on 2021-03-18.
//  Copyright © 2021 Andy Hooper. All rights reserved.
//
//  https://academy.realm.io/posts/goto-mike-ash-exploring-swift-memory-layout/

import Foundation

func printObjectData<T:AnyObject>(_ object:T) {
    let address = unsafeBitCast(object, to:UInt64.self),
        length = class_getInstanceSize(T.self)
    print(T.self, String(format: "%x:", address))
    var buffer = Array<UInt8>(repeating:0, count:length)
    buffer.withUnsafeMutableBufferPointer { (bufferPointer:inout UnsafeMutableBufferPointer<UInt8>) in
        var readSize: mach_vm_size_t = 0
        mach_vm_read_overwrite(mach_task_self_,
                                address,
                                mach_vm_size_t(bufferPointer.count),
                                unsafeBitCast(bufferPointer.baseAddress, to:UInt64.self),
                               &readSize)
    }
    for (index,byte) in buffer.enumerated() {
        let sep = (index > 0 && index % 8 == 0) ? " " : ""
        print(sep, String(format: "%02x",byte), separator:"", terminator:"")
    }
    print()
}
