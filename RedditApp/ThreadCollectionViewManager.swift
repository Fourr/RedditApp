//
//  ThreadCollectionViewManager.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 6/27/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation
import UIKit

final class ThreadCollectionViewManager: NSObject, UICollectionViewDelegate {
    
    var cellViewModels = [ListingCellViewModel]() {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    private weak var collectionView: UICollectionView?
    
    func configure(collectionView: UICollectionView) {
        self.collectionView = collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ThreadCollectionViewManager: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ListingCollectionViewCell.self), for: indexPath) as? ListingCollectionViewCell else {
            fatalError("Unable to dequeue a ListingCell.")
        }
        
        let cellViewModel = cellViewModels[indexPath.item]
        
        cellViewModel.configure(cell: cell)
        
        return cell
    }
}

extension ThreadCollectionViewManager: UICollectionViewDelegateFlowLayout {
    func spaceVertically() {

    }

    func spaceHorizontally() {

    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 300, height: 200)
    }

}

