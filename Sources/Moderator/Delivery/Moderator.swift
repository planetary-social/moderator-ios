//
//  Moderator.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation

public class Moderator {

    public static var shared = Moderator(service: ModeratorServiceAdapter(api: APIServiceAdapter()))
    var service: ModeratorService

    init(service: ModeratorService) {
        self.service = service
    }

    public func handshake(completion: @escaping ((Bool) -> Void)) {
        service.handshake(completion: completion)
    }

}
