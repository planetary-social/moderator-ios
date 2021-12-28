//
//  ModeratorServiceAdapter.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation

class ModeratorServiceAdapter: ModeratorService {

    var api: APIService

    var session: Session?
    var capsule: Capsule?
    var handshaked: Bool

    init(api: APIService) {
        self.api = api
        self.handshaked = false
    }

    func handshake(completion: @escaping ((Bool) -> Void)) {
        api.handshake { session, capsule in
            self.session = session
            self.capsule = capsule
            self.handshaked = true
            completion(true)
        }
    }

    func posts(completion: @escaping ((Capsule?) -> Void)) {
        if handshaked {
            completion(self.capsule)
        } else {
            handshake { _ in
                completion(self.capsule)
            }
        }
    }
}
