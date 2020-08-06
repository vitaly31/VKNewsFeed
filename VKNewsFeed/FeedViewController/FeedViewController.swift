//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Виталий Косинов on 04/08/2020.
//  Copyright © 2020 Виталий Косинов. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var networkService: Networking = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemBlue
        let params = ["filters": "post, photo"]
        networkService.request(path: API.newsFeed, params: params) { (data, error) in
            if let error = error {
                print("Error recived requesting data: \(error.localizedDescription)")
            }
            guard let data = data else { return }
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            print("json: \(json)")
        }
    }
}
