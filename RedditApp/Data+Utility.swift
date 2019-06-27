//
//  Data+Utility.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 6/26/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation

extension Data {
    func printAsJSON() {
        guard let json = (try? JSONSerialization.jsonObject(with:
            self, options: [])) as? [String: Any] else {
                return
        }
        
        print(json)
    }
}

