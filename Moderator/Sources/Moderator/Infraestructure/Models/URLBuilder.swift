//
//  File.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation

class URLBuilder {

    let components: URLComponents?

    init(baseURL: String) {
        self.components = URLComponents(string: baseURL)
    }

    func buildForHandshake() -> URL? {
        var components = components
        components?.queryItems = [URLQueryItem(name: "bin", value: "true")]
        return components?.url
    }

}
