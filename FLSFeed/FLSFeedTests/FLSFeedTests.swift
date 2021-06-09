//
//  FLSFeedTests.swift
//  FLSFeedTests
//
//  Created by Francisco Lopez on 29/05/2021.
//

import XCTest
 import FLSFeed


class FLSFeedTests: XCTestCase {
    
    
//FIRST TEST!
    func test_init_doesNotRequestDataFromURL(){
         let (_, client) = makeSUT()
        XCTAssertNil(client.requestedURL)
    }
    
    
    
    func test_load_requestDataFromURL(){
        let url = URL(string: "http://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        
//        XCTAssertNotNil(client.requestedURL)
  
        // i want my url matches
        XCTAssertEqual(client.requestedURL, url)
    }
    
    
    // MARK: - Helpers
     
    
    
    private func makeSUT(url: URL = URL(string: "http://a-given-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy){
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        func get(from url: URL){
            requestedURL = url
        }
    }

                         
    
}
