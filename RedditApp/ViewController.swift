//
//  ViewController.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 5/6/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let test = Network()
    override func viewDidLoad() {
        super.viewDidLoad()
        test.callRedditAPI()
    }


}

