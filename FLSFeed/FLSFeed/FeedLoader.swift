//
//  FeedLoader.swift
//  FLSFeed
//
//  Created by Francisco Lopez on 29/05/2021.
//

import Foundation

enum LoadFeedResult {
    case succes([FeedItem])
    case error(Error)
}


protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
