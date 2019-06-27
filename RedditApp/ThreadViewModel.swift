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
        networkService.fetchThread { result in
            print(result)
        }
    }
    func configure(collectionView: UICollectionView) {
        
    }
    
}
