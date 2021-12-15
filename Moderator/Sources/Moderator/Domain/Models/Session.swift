//
//  Session.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation

class Session {

    var id: String

    init(id: String) {
        self.id = id
    }
    
}

extension Session: Equatable {

    static func == (lhs: Session, rhs: Session) -> Bool {
        return lhs.id == rhs.id
    }
    
}
