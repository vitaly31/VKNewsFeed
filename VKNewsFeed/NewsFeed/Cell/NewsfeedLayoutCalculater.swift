//
//  NewsfeedLayoutCalculater.swift
//  VKNewsFeed
//
//  Created by Виталий Косинов on 10/08/2020.
//  Copyright © 2020 Виталий Косинов. All rights reserved.
//

import UIKit

struct Sizes: FeedCellSizes {
    var postLabeFrame: CGRect
    var attachmentFrame: CGRect
}

protocol FeedCellLayoutCalculatorProtocol {
        func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentModel?) -> FeedCellSizes
    
}

final class FeedCellLayoutCalculater: FeedCellLayoutCalculatorProtocol {
    
    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }

    
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentModel?) -> FeedCellSizes {
        return Sizes(postLabeFrame: CGRect.zero, attachmentFrame: CGRect.zero)
    }
}
