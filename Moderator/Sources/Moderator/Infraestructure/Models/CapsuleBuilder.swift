//
//  File.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation

class CapsuleBuilder {

    func build(data: Data) -> Capsule? {
        var katamari: Data?
        var threads: Data?
        var groups: Data?

        var offset: Int = 6

        if data.dropFirst(offset).prefix(1).reduce(0, { $0 << 8 | UInt8($1) }) == 0 {
            offset += 1
        } else {
            offset += 1
            let kDataLength = data.dropFirst(offset).prefix(2).reduce(0) { $0 << 8 | UInt16($1) }
            offset += 2
            katamari = Data(data.dropFirst(offset).prefix(Int(kDataLength)))
            offset += Int(kDataLength)
        }

        if data.dropFirst(offset).prefix(1).reduce(0, { $0 << 8 | UInt8($1) }) == 0 {
            offset += 1
        } else {
            offset += 1
            let tDataLength = data.dropFirst(offset).prefix(2).reduce(0) { $0 << 8 | UInt16($1) }
            offset += 2
            threads = Data(data.dropFirst(offset).prefix(Int(tDataLength)))
            offset += Int(tDataLength)
        }

        if data.dropFirst(offset).prefix(1).reduce(0, { $0 << 8 | UInt8($1) }) == 0 {
            offset += 1
        } else {
            offset += 1
            let gDataLength = data.dropFirst(offset).prefix(2).reduce(0) { $0 << 8 | UInt16($1) }
            offset += 2
            groups = Data(data.dropFirst(offset).prefix(Int(gDataLength)))
            offset += Int(gDataLength)
        }

        return Capsule(katamari: katamari, threads: threads, groups: groups)
    }

}
