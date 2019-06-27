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
    // create variable to hold cell view models
    // What the variable is set, reload the collectionView
    
    func configure(collectionView: UICollectionView) {
        // register listing cell with collection view
        // set delegate and datasource
    }
    
}
/*
extension ThreadCollectionViewManager: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
//    func numberOfRowsInSection -> Int {
//        // RETURN # OF CELL VIEW MODELS
//    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return cell
    }
//    func cellForItem() -> UICollectionViewCell {
//        // dequeue cell from collectionView
//        // configure cell using cell view model configure method
//        // return cell
//    }
}

extension ThreadCollectionViewManager: UICollectionViewFlowLayoutDelegate {
    func spaceVertically() {
        
    }
    
    func spaceHorizontally() {
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
    }
 
}
*/
