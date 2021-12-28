//
//  ModeratorService.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation

protocol ModeratorService {

    func posts(completion: @escaping ((Capsule?) -> Void))
    
}
