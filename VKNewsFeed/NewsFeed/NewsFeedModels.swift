//
//  NewsFeedModels.swift
//  VKNewsFeed
//
//  Created by Виталий Косинов on 09/08/2020.
//  Copyright (c) 2020 Виталий Косинов. All rights reserved.
//

import UIKit

enum NewsFeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getNewsfeed
      }
    }
    struct Response {
      enum ResponseType {
        case presentNewsFeed(feed: FeedResponse)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case displayNewsFeed(feedViewModel: FeedViewModel)
      }
    }
  }
  
}

struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        var iconUrlString: String
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
        var photoAttachment: FeedCellPhotoAttachmentModel?
        var sizes: FeedCellSizes
    }
    
    struct FeedCellPhotoAttachment: FeedCellPhotoAttachmentModel {
        var photoUrlString: String?
        var width: Int
        var height: Int
    }
    
    let cells: [Cell]
}
