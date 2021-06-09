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
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    
    
    func test_load_requestDataFromURL(){
        let url = URL(string: "http://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        
        XCTAssertEqual(client.requestedURLs, [url])
    }
    
    func test_loadTwice_requestDataFromURLTwice(){
        let url = URL(string: "http://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        sut.load()
        sut.load()
        
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    // MARK: - Helpers
     
    
    
    private func makeSUT(url: URL = URL(string: "http://a-given-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy){
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
         var requestedURLs = [URL]()
        
        func get(from url: URL){
             requestedURLs.append(url)
        }
    }

                         
    
}
