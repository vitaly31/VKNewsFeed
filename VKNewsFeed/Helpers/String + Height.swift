//
//  String + Height.swift
//  VKNewsFeed
//
//  Created by Виталий Косинов on 10/08/2020.
//  Copyright © 2020 Виталий Косинов. All rights reserved.
//

import UIKit

extension String {
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let size = self.boundingRect(with: textSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font : font],
                                     context: nil)
        return ceil(size.height)
    }
    
}
