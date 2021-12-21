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

    var urlSession: URLSession!
    var adapter: APIServiceAdapter!

    override func setUp() {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolMock.self]
        urlSession = URLSession(configuration: configuration)
        adapter = APIServiceAdapter(urlSession: urlSession)
    }

    func testHandshake() {
        let expectation = XCTestExpectation()

        URLProtocolMock.requestHandler = { request in
            let url = Bundle.module.url(forResource: "valid_capsule", withExtension: nil)!
            let data = try! Data(contentsOf: url)
            let headerFields = ["set-cookie": "DARTSESSID=de5d89ec2238b9f55611cf60172520e4; Path=/; HttpOnly"]
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 200,
                                           httpVersion: "2.0",
                                           headerFields: headerFields)!
            return (response, data)
        }

        adapter.handshake { session, capsule in
            XCTAssertNotNil(session)
            XCTAssertEqual(session, Session(id: "de5d89ec2238b9f55611cf60172520e4"))
            XCTAssertNotNil(capsule)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

}
