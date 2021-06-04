//
//  FLSFeedTests.swift
//  FLSFeedTests
//
//  Created by Francisco Lopez on 29/05/2021.
//

import XCTest
@testable import FLSFeed


class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
   
    func load(){
        client.get(from: url)
    }
}

class HTTPClient {
    func get(from url: URL){}
}

class HTTPClientSpy: HTTPClient {
   override func get(from url: URL){
        requestedURL = url
    }
    
    var requestedURL: URL?
}


class FLSFeedTests: XCTestCase {
    
    
//FIRST TEST!
    func test_init_doesNotRequestDataFromURL(){
        
        let url = URL(string: "http://a-given-url.com")!
        let client = HTTPClientSpy()

        _ = RemoteFeedLoader(url: url, client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    
    func test_init_requestDataFromURL(){
        let url = URL(string: "http://a-given-url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        sut.load()
        
//        XCTAssertNotNil(client.requestedURL)
  
        // i want my url matches
        XCTAssertEqual(client.requestedURL, url)
    }
    
}
