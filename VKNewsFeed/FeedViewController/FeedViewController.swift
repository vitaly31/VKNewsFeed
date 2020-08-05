//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Виталий Косинов on 04/08/2020.
//  Copyright © 2020 Виталий Косинов. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.getFeed()
        
        view.backgroundColor = .systemBlue
    }
}
