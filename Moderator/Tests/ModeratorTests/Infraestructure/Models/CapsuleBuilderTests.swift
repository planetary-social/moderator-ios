//
//  CapsuleBuilderTests.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation
import XCTest
@testable import Moderator

class CapsuleBuilderTests: XCTestCase {

    var builder: CapsuleBuilder!

    override func setUp() {
        builder = CapsuleBuilder()
    }

    func testBuildWithValidData() {
        let url = Bundle.module.url(forResource: "valid_data", withExtension: nil)!
        let data = try! Data(contentsOf: url)
        let capsule = builder.build(data: data)
        XCTAssertNotNil(capsule)
        XCTAssertNotNil(capsule?.katamari)
        XCTAssertNotNil(capsule?.threads)
        XCTAssertNotNil(capsule?.groups)
    }

}
