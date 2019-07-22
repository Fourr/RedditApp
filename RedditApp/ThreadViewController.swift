//
//  ViewController.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 5/6/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import UIKit

final class ThreadViewController: UIViewController {
    
    private let viewModel = ThreadViewModel()
    
    private let titleLabel = UILabel()
    private let searchBar = UISearchBar()
    private let refreshControl = UIRefreshControl()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureCollectionView()
        viewModel.fetchThread()
    }
    
    private func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = view.backgroundColor
        
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        viewModel.configure(collectionView: collectionView)
    }
}

//final class ThreadViewController {
//    private let viewModel = ThreadViewModel()
//    private let titleLabel = UILabel()
//    private let searchBar = UISearchBar()
//
//    private let refreshControl = UIRefreshControl()
//    private let collectionView = UICollectionView()
//
//    func viewDidLoad() {
//        viewModel.configure(collectionView: collectionView)
//    }
//}
