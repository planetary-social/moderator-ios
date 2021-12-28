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

    public func everyone(completion: @escaping (([Post]) -> Void)) {
        service.posts { capsule in
            guard let items = capsule?.threads?.items else {
                completion([])
                return
            }
            completion(items.map({ item in
                let builder = PostBuilder()
                return builder.build(item: item)
            }))
        }
    }

}
