//
//  Capsule.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation

class Capsule {

    var katamari: Data?
    var threads: Data?
    var groups = Data?

    init(katamari: Data?, threads: Data?, groups: Data?) {
        self.katamari = katamari
        self.threads = threads
        self.groups = groups
    }

}
