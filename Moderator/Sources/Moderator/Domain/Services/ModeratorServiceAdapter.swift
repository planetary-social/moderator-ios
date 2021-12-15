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

    init(api: APIService) {
        self.api = api
    }

    func handshake(completion: @escaping ((Bool) -> Void)) {
        api.handshake { session, capsule in
            self.session = session
            self.capsule = capsule
            completion(true)
        }
    }
}
