//
//  ViewController.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 5/6/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let test = NetworkingService()
    override func viewDidLoad() {
        super.viewDidLoad()

        test.authenticate { success in
            print(success)
        }
    }


}

