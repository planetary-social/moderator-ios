//
//  SessionBuilder.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation

class SessionBuilder {

    func build(cookie: String) -> Session? {
        guard let first = cookie.split(separator: " ").first else {
            return nil
        }
        guard let last = String(first).split(separator: "=").last else {
            return nil
        }
        let prefix = String(last).prefix(last.count - 1)
        return Session(id: String(prefix))
    }

}
