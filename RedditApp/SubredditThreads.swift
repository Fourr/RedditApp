//
//  SubredditThreads.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 6/17/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation
struct SubredditThreads: Codable {
    let data: SubredditThreads2
}
struct SubredditThreads2: Codable {
    let after: String
    //let before: String
    let children: [children]
}


struct children : Codable {
    let data : grandChildren
}

struct grandChildren : Codable {
    let url : String
    let title : String
    let permalink: String
}
