//
//  URLBuilderTests.swift
//  
//
//  Created by Martin Dutra on 14/12/21.
//

import Foundation
import XCTest
@testable import Moderator

class URLBuilderTests: XCTestCase {

    var builder: URLBuilder!

    override func setUp() {
        builder = URLBuilder(baseURL: "www.example.com")
    }

    func testBuildForHandshake() {
        let expectedAbsoluteString = "www.example.com?bin=true"
        let url = builder.buildForHandshake()
        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString, expectedAbsoluteString)
    }

}
