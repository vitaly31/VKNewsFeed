//
//  NewsFeedViewController.swift
//  VKNewsFeed
//
//  Created by Виталий Косинов on 09/08/2020.
//  Copyright (c) 2020 Виталий Косинов. All rights reserved.
//

import UIKit

protocol NewsFeedDisplayLogic: class {
  func displayData(viewModel: NewsFeed.Model.ViewModel.ViewModelData)
}

class NewsFeedViewController: UIViewController, NewsFeedDisplayLogic {

  var interactor: NewsFeedBusinessLogic?
  var router: (NSObjectProtocol & NewsFeedRoutingLogic)?
    
    private var feedViewModel = FeedViewModel.init(cells: [])
    @IBOutlet weak var tableView: UITableView!
    
  
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = NewsFeedInteractor()
    let presenter             = NewsFeedPresenter()
    let router                = NewsFeedRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()

    tableView.register((UINib(nibName: "NewsfeedCell", bundle: nil)), forCellReuseIdentifier: NewsfeedCell.reuseId)
    
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear
    view.backgroundColor = #colorLiteral(red: 0.07817285508, green: 0.4620802402, blue: 1, alpha: 1)
    
    interactor?.makeRequest(request: .getNewsfeed)
  }
  
  func displayData(viewModel: NewsFeed.Model.ViewModel.ViewModelData) {
    
    switch viewModel {
        
    case .displayNewsFeed(let feedViewModel):
        self.feedViewModel = feedViewModel
        tableView.reloadData()

    }

  }
  
}

extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feedViewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsfeedCell.reuseId, for: indexPath) as! NewsfeedCell
        let cellViewModel = feedViewModel.cells[indexPath.row]
        cell.set(viewModel: cellViewModel)
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 212
    }
    
    
    
}
