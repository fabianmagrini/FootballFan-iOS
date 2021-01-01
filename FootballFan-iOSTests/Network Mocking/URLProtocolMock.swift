//
//  URLProtocolMock.swift
//  FootballFan-iOSTests
//
//  Created by Fabian Magrini on 1/1/21.
//

import Foundation

class URLProtocolMock: URLProtocol {
    // maps URLs to test data
    static var testURLs = [URL?: Data]()

    // handle all types of request
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    // simply return what we were given
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    // does the stubbing and will load the test data mapped to the URL
    override func startLoading() {
        if let url = request.url {
            if let data = URLProtocolMock.testURLs[url] {
                self.client?.urlProtocol(self, didLoad: data)
            }
        }

        self.client?.urlProtocolDidFinishLoading(self)
    }

    // required but no implementation
    override func stopLoading() { }
}
