//
//  CapsuleItemSetBuilder.swift
//  
//
//  Created by Martin Dutra on 16/12/21.
//

import Foundation

class CapsuleItemSetBuilder {

    func build(data: Data) -> CapsuleItemSet? {
        var items = [CapsuleItem]()
        
        var offset: Int = 0
        while offset < data.count {
            let iDataLength = data.dropFirst(offset).prefix(2).reduce(0) { $0 << 8 | UInt16($1) }

            let builder = CapsuleItemBuilder()
            if let item = builder.build(data: Data(data.dropFirst(offset).prefix(Int(iDataLength)))) {
                items.append(item)
            }

            offset += Int(iDataLength)
        }
        
        return CapsuleItemSet(items: items)
    }

}
