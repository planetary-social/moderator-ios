//
//  File.swift
//  
//
//  Created by Martin Dutra on 21/12/21.
//

import Foundation

class CapsuleItemBuilder {

    func build(data: Data) -> CapsuleItem? {
        let leng = data.dropFirst(0).prefix(2).reduce(0) { $0 << 8 | UInt16($1) }
        let flags = data.dropFirst(2).prefix(2).reduce(0) { $0 << 8 | UInt16($1) }
        let ah = data.dropFirst(4).prefix(8).reduce(0) { $0 << 8 | UInt64($1) }
        let bl = data.dropFirst(12).prefix(8).reduce(0) { $0 << 8 | UInt64($1) }
        let pp = data.dropFirst(20).prefix(8).reduce(0) { $0 << 8 | UInt64($1) }
        let gt = data.dropFirst(28).prefix(2).reduce(0) { $0 << 8 | UInt16($1) }
        let ple = data.dropFirst(30).prefix(2).reduce(0) { $0 << 8 | UInt16($1) }
        let timestamp = data.dropFirst(32).prefix(8).reduce(0) { $0 << 8 | UInt64($1) }

        var offset: Int = 40
        let payload = Data(data.dropFirst(offset).prefix(Int(ple)))
        offset += Int(ple)

        let kle = data.dropFirst(offset).prefix(2).reduce(0) { $0 << 8 | UInt16($1) }
        offset += 2

        let key: Data?
        if kle > 0 {
            key = Data(data.dropFirst(offset).prefix(Int(kle)))
            offset += Int(kle)
        } else {
            key = nil
        }

        let hi = data.dropFirst(offset).prefix(8).reduce(0) { $0 << 8 | UInt64($1) }
        offset += 8

        let aav = data.dropFirst(offset).prefix(1).reduce(0) { $0 << 8 | UInt8($1) }
        offset += 1

        let authorNick: String?
        if aav > 0 {
            authorNick = String(data: Data(data.dropFirst(offset).prefix(Int(aav))), encoding: .utf8)
            offset += Int(aav)
        } else {
            authorNick = nil
        }

        let abl = data.dropFirst(offset).prefix(1).reduce(0) { $0 << 8 | UInt8($1) }
        offset += 1

        let authorAvatar: String?
        if abl > 0 {
            authorAvatar = String(data: Data(data.dropFirst(offset).prefix(Int(abl))), encoding: .utf8)
            offset += Int(abl)
        } else {
            authorAvatar = nil
        }

        let atl = data.dropFirst(offset).prefix(1).reduce(0) { $0 << 8 | UInt8($1) }
        offset += 1

        let attachmentLink: Data?
        if atl > 0 {
            attachmentLink = Data(data.dropFirst(offset).prefix(Int(atl)))
            offset += Int(atl)
        } else {
            attachmentLink = nil
        }

        var likes: UInt16 = 0
        if offset + 2 < leng {
            likes = data.dropFirst(offset).prefix(2).reduce(0) { $0 << 8 | UInt16($1) }
        }
        offset += 2

        var shares: UInt16 = 0
        if offset + 2 < leng {
            shares = data.dropFirst(offset).prefix(2).reduce(0) { $0 << 8 | UInt16($1) }
        }

        return CapsuleItem(flags: flags,
                           authorHint: ah,
                           bl: bl,
                           pp: pp,
                           garyTimestamp: Int(gt),
                           payloadLenght: Int(ple),
                           payload: payload,
                           keyLen: Int(kle),
                           key: key,
                           hint: hi,
                           lenghtInBytes: Int(leng),
                           authorAvatar: authorAvatar,
                           authorNick: authorNick,
                           attachmentLink: attachmentLink,
                           perceivedTimestamp: timestamp,
                           likes: Int(likes),
                           shares: Int(shares))

    }
    
}
