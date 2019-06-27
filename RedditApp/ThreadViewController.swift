//
//  ViewController.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 5/6/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let viewModel = ThreadViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        viewModel.fetchThread()

    }


}
final class ThreadViewController: UIViewController {
    private let viewModel = ThreadViewModel()
    private let titleLabel = UILabel()
    private let searchBar = UISearchBar()
    
    private let refreshControl = UIRefreshControl()
    private let collectionView = UICollectionView()
    
    override func viewDidLoad() {
        viewModel.configure(collectionView: collectionView)
    }
    
    
}
