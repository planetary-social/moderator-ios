//
//  APIServiceAdapterTests.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation
import XCTest
@testable import Moderator

class APIServiceAdapterTests: XCTestCase {

    var adapter: APIServiceAdapter!

    override func setUp() {
        adapter = APIServiceAdapter()
    }

    func testHandshake() {
        let expectation = XCTestExpectation()
        adapter.handshake { session, capsule in
            XCTAssertNotNil(session)
            XCTAssertNotNil(capsule)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

}
