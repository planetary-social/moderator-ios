//
//  CapsuleItemSetBuilderTests.swift
//  
//
//  Created by Martin Dutra on 21/12/21.
//

import Foundation
import XCTest
@testable import Moderator

class CapsuleItemSetBuilderTests: XCTestCase {

    var builder: CapsuleItemSetBuilder!

    override func setUp() {
        builder = CapsuleItemSetBuilder()
    }

    func testBuildWithValidData() {
        let url = Bundle.module.url(forResource: "valid_capsule_item_set", withExtension: nil)!
        let data = try! Data(contentsOf: url)
        let itemSet = builder.build(data: data)
        XCTAssertNotNil(itemSet)
        XCTAssertEqual(itemSet?.items.count, 54)

    }

}
