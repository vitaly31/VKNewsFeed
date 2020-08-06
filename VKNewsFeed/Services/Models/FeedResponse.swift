//
//  FeedResponse.swift
//  VKNewsFeed
//
//  Created by Виталий Косинов on 06/08/2020.
//  Copyright © 2020 Виталий Косинов. All rights reserved.
//

import Foundation

struct FeedResponse: Decodable {
    var items: [FeedItem]
}

struct FeedItem: Decodable {
    let sourceId: Int
}
