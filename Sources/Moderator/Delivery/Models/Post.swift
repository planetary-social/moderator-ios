//
//  File.swift
//  
//
//  Created by Martin Dutra on 26/12/21.
//

import Foundation

public extension Moderator {

    struct Post {
        public var flags: UInt16
        public var authorHint: UInt64
        public var bl: UInt64
        public var pp: UInt64
        public var garyTimestamp: Int
        public var payloadLenght: Int
        public var payload: Data
        public var keyLen: Int
        public var key: Data?
        public var hint: UInt64
        public var lenghtInBytes: Int
        public var authorAvatar: String?
        public var authorNick: String?
        public var attachmentLink: Data?
        public var perceivedTimestamp: UInt64
        public var likes: Int
        public var shares: Int

        public init(flags: UInt16,
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
