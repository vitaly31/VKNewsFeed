//
//  ViewController.swift
//  VKNewsFeed
//
//  Created by Виталий Косинов on 04/08/2020.
//  Copyright © 2020 Виталий Косинов. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .blue
    }

    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}

