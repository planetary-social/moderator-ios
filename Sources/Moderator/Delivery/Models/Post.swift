//
//  File.swift
//  
//
//  Created by Martin Dutra on 26/12/21.
//

import Foundation

public extension Moderator {

    struct Post {
        var flags: UInt16
        var authorHint: UInt64
        var bl: UInt64
        var pp: UInt64
        var garyTimestamp: Int
        var payloadLenght: Int
        var payload: Data
        var keyLen: Int
        var key: Data?
        var hint: UInt64
        var lenghtInBytes: Int
        var authorAvatar: String?
        var authorNick: String?
        var attachmentLink: Data?
        var perceivedTimestamp: UInt64
        var likes: Int
        var shares: Int

        init(flags: UInt16,
             authorHint: UInt64,
             bl: UInt64,
             pp: UInt64,
             garyTimestamp: Int,
             payloadLenght: Int,
             payload: Data,
             keyLen: Int,
             key: Data? = nil,
             hint: UInt64,
             lenghtInBytes: Int,
             authorAvatar: String? = nil,
             authorNick: String? = nil,
             attachmentLink: Data? = nil,
             perceivedTimestamp: UInt64,
             likes: Int,
             shares: Int) {
            self.flags = flags
            self.authorHint = authorHint
            self.bl = bl
            self.pp = pp
            self.garyTimestamp = garyTimestamp
            self.payloadLenght = payloadLenght
            self.payload = payload
            self.keyLen = keyLen
            self.key = key
            self.hint = hint
            self.lenghtInBytes = lenghtInBytes
            self.authorAvatar = authorAvatar
            self.authorNick = authorNick
            self.attachmentLink = attachmentLink
            self.perceivedTimestamp = perceivedTimestamp
            self.likes = likes
            self.shares = shares
        }
    }
    
}
