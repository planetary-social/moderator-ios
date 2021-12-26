//
//  Capsule.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation

class Capsule {

    var katamari: Data?
    var threads: CapsuleItemSet?
    var groups: CapsuleItemSet?

    init(katamari: Data?, threads: CapsuleItemSet?, groups: CapsuleItemSet?) {
        self.katamari = katamari
        self.threads = threads
        self.groups = groups
    }

}
