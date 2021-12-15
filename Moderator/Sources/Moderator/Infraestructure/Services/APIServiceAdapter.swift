//
//  APIServiceAdapter.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation

class APIServiceAdapter: APIService {

    var urlSession: URLSession
    var urlBuilder: URLBuilder

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
        self.urlBuilder = URLBuilder(baseURL: "https://www.omasome.fi")
    }

    func handshake(completion: @escaping ((Session?, Capsule?) -> Void)) {
        guard let url = urlBuilder.buildForHandshake() else {
            fatalError("Couldn't build a URL for handshake()")
        }
        let urlRequest = URLRequest(url: url)
        let dataTask = urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
            guard let httpURLResponse = urlResponse as? HTTPURLResponse else {
                completion(nil, nil)
                return
            }
            guard let cookie = httpURLResponse.value(forHTTPHeaderField: "set-cookie") else {
                completion(nil, nil)
                return
            }
            let sessionBuilder = SessionBuilder()
            guard let session = sessionBuilder.build(cookie: cookie) else {
                completion(nil, nil)
                return
            }
            guard let data = data else {
                completion(nil, nil)
                return
            }
            let capsuleBuilder = CapsuleBuilder()
            guard let capsule = capsuleBuilder.build(data: data) else {
                completion(nil, nil)
                return
            }
            completion(session, capsule)
        }
        dataTask.resume()
    }
    
}
