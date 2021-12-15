//
//  SessionBuilderTests.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation
import XCTest
@testable import Moderator

class SessionBuilderTests: XCTestCase {

    var builder: SessionBuilder!

    override func setUp() {
        builder = SessionBuilder()
    }

    func testBuildWithValidCookie() {
        let expectedValue = Session(id: "de5d89ec2238b9f55611cf60172520e4")
        let cookie = "DARTSESSID=de5d89ec2238b9f55611cf60172520e4; Path=/; HttpOnly"
        XCTAssertEqual(builder.build(cookie: cookie), expectedValue)
    }

}
