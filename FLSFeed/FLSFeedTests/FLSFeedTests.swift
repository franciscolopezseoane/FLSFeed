//
//  FLSFeedTests.swift
//  FLSFeedTests
//
//  Created by Francisco Lopez on 29/05/2021.
//

import XCTest
@testable import FLSFeed


class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}


class FLSFeedTests: XCTestCase {
    
    
//FIRST TEST!
    func test_init_doesNotRequestDataFromURL(){
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
}
