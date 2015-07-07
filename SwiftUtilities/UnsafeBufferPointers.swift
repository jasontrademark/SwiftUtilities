//
//  Pointers+Extensions.swift
//  SwiftUtilities
//
//  Created by Jonathan Wight on 6/23/15.
//  Copyright (c) 2015 schwa.io. All rights reserved.
//

import Foundation

public extension UnsafeMutableBufferPointer {
    func toUnsafeBufferPointer() -> UnsafeBufferPointer <T> {
        return UnsafeBufferPointer <T> (start: baseAddress, count: count)
    }
}

extension UnsafeBufferPointer {
    public func dump(cap:Int = 256) -> String {
        let limit = min(length, cap)
        var dump:String = " ".join(stride(from: 0, to: limit, by: 4).map() {
            let region = self[$0..<min($0 + 4, limit)]
            return region.asHex
        })
        if length > cap {
            dump = "<\(dump) ...>"
        }
        else {
            dump = "<\(dump)>"
        }

        return dump
    }
}


extension UnsafeBufferPointer: CustomStringConvertible {
    public var description: String {
        return "UnsafeBufferPointer(start: \(self.baseAddress), length: \(length), \(dump())"
    }
}
