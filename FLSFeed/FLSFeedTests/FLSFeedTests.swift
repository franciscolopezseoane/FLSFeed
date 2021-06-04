//
//  FLSFeedTests.swift
//  FLSFeedTests
//
//  Created by Francisco Lopez on 29/05/2021.
//

import XCTest
@testable import FLSFeed


class RemoteFeedLoader {
    
    func load(){
        HTTPClient.shared.get(from: URL(string: "http://a-url.com")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    func get(from url: URL){ }
    

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
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    
    func test_init_requestDataFromURL(){
        let client = HTTPClientSpy()
        
        HTTPClient.shared = client
        
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
    
}
