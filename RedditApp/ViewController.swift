//
//  ViewController.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 5/6/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .userInitiated).async {
            let NS = NetworkingService()
            NS.authenticate { success in
                print(success)
                
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let NS = NetworkingService()
            NS.getComments { success in
                print(success)
            }
        }
    }


}

