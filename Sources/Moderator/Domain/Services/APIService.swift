//
//  APIService.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation

protocol APIService {

    func handshake(completion: @escaping ((Session?, Capsule?) -> Void))
    
}
