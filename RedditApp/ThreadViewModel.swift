//
//  ViewModel.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 6/26/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation
import UIKit

final class ThreadViewModel {
    private let networkService = NetworkingService()
    private let collectionViewManager = ThreadCollectionViewManager()
    
    func fetchThread() {
        if UserDefaults.standard.object(forKey:"token") == nil {
            networkService.authenticate { [weak self] success in
                print(success)
                if success {
                    self?.fetchThread()
                } else {
                    UserDefaults.standard.removeObject(forKey: "token")
                }
            }
        }
        
        networkService.fetchThread { [weak self] result in
            guard let self = self else { return }
            guard let thread = try? result.get() else { return }
            let cellViewModels = thread.listings.map(ListingCellViewModel.init)
            DispatchQueue.main.async {
                self.collectionViewManager.cellViewModels = cellViewModels
            }
        }
    }
    
    func configure(collectionView: UICollectionView) {
        //collectionView.register(ListingCollectionViewCell.self,
                                //forCellWithReuseIdentifier: String(describing: ListingCollectionViewCell.self))
        collectionView.register(UINib(nibName: "ListingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: ListingCollectionViewCell.self))
        collectionViewManager.configure(collectionView: collectionView)
    }
    
}
