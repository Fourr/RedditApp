//
//  Object.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 5/9/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation
// Query service creates Track objects
class Reddit {
    
    let name: String
    let artist: String
    let previewURL: URL
    let index: Int
    var downloaded = false
    
    init(name: String, artist: String, previewURL: URL, index: Int) {
        self.name = name
        self.artist = artist
        self.previewURL = previewURL
        self.index = index
    }
    
}
