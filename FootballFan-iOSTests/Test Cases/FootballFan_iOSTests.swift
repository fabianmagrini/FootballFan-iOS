//
//  FootballFan_iOSTests.swift
//  FootballFan-iOSTests
//
//  Created by Fabian Magrini on 31/12/20.
//

import XCTest
@testable import FootballFan_iOS

class FootballFan_iOSTests: XCTestCase {
    // MARK: - Properties

    var data: Data!

    // MARK: - Set Up & Tear Down

    override func setUpWithError() throws {
        data = loadStub(name: "posts", extension: "json")
    }

    override func tearDownWithError() throws {

    }

    func testSuccessfulResponse() {
        // Setup our objects
        
        // this is the URL we expect to call
        let url = URL(string: "https://afternoon-gorge-60512.herokuapp.com/api/posts")

        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: data]

        // now set up a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]

        // and create the URLSession from that
        let session = URLSession(configuration: config)
        
        let api = FootballFanAPI(session: session)

        api.fetchPosts() { (posts, error) in
            XCTAssertNotNil(posts)
        }
    }
    
    
    

}
