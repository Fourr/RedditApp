//
//  Thread.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 6/26/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation

struct Thread: Decodable {
    let listings: [Listing]
    private enum CodingKeys: String, CodingKey {
        case data
        case children
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
            .nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        var listings = [Listing]()
        var children = try container.nestedUnkeyedContainer(forKey: .children)
        while !children.isAtEnd {
            let nestedDecoder = try children.superDecoder()
            let listing = try Listing(from: nestedDecoder)
            listings.append(listing)
        }
        self.listings = listings
    }
    
    
}
