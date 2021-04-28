//
//  InstrumentObjcMessageSends.swift
//  AEdit
//
// https://gist.github.com/bolencki13/c3e6bf6d9bb3e474b3053d5aa45eb376
// https://www.dribin.org/dave/blog/archives/2006/04/22/tracing_objc/
//
//  Created by Andy Hooper on 2020-12-11.
//  Copyright © 2020 Andy Hooper. All rights reserved.
//

import Foundation

func instrumentObjcMessageSends(on: Bool) {
    let libobjc: UnsafeMutableRawPointer = dlopen("/usr/lib/libobjc.dylib", RTLD_LAZY)
    guard let sym = dlsym(libobjc, "instrumentObjcMessageSends") else {
        print("Could not find instrumentObjcMessageSends")
        exit(1)
    }
    typealias instrumentObjcMessageSendsFunc = @convention(c) (_ on: ObjCBool) -> Int
    let f = unsafeBitCast(sym,to: instrumentObjcMessageSendsFunc.self)
    _ = f(ObjCBool(on))
    print("InstrumentObjcMessageSends", on ? "enabled" : "disabled")
}
