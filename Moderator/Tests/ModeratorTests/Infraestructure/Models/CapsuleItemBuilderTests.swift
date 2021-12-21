//
//  CapsuleItemBuilderTests.swift
//  
//
//  Created by Martin Dutra on 21/12/21.
//

import Foundation
import XCTest
@testable import Moderator

class CapsuleItemBuilderTests: XCTestCase {

    var builder: CapsuleItemBuilder!

    override func setUp() {
        builder = CapsuleItemBuilder()
    }

    func testBuildWithValidData() {
        let url = Bundle.module.url(forResource: "valid_capsule_item", withExtension: nil)!
        let data = try! Data(contentsOf: url)
        let capsuleItem = builder.build(data: data)
        XCTAssertNotNil(capsuleItem)
        XCTAssertEqual(capsuleItem?.authorAvatar, "maju")
        XCTAssertEqual(capsuleItem?.authorNick, "👝")
        XCTAssertEqual(capsuleItem?.payloadLenght, 8)
        XCTAssertEqual(capsuleItem?.payload, "#art dog".data(using: .utf8))
        XCTAssertEqual(capsuleItem?.likes, 0)
        XCTAssertEqual(capsuleItem?.shares, 0)
        let expectedTimestamp: UInt64 = UInt64(Double(1639466382.078) * Double(1000))
        XCTAssertEqual(capsuleItem?.perceivedTimestamp, expectedTimestamp)
    }

}
