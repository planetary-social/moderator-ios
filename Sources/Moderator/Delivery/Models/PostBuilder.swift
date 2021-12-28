//
//  File.swift
//  
//
//  Created by Martin Dutra on 26/12/21.
//

import Foundation

class PostBuilder {

    func build(item: CapsuleItem) -> Moderator.Post {
        return Moderator.Post(flags: item.flags,
                              authorHint: item.authorHint,
                              bl: item.bl,
                              pp: item.pp,
                              garyTimestamp: item.garyTimestamp,
                              payloadLenght: item.payloadLenght,
                              payload: item.payload,
                              keyLen: item.keyLen,
                              key: item.key,
                              hint: item.hint,
                              lenghtInBytes: item.lenghtInBytes,
                              authorAvatar: item.authorAvatar,
                              authorNick: item.authorNick,
                              attachmentLink: item.attachmentLink,
                              perceivedTimestamp: item.perceivedTimestamp,
                              likes: item.likes,
                              shares: item.shares)
    }

}
