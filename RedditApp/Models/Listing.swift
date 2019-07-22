//
//  Listing.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 6/26/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation

struct Listing: Decodable {
    
    let author: String
    let descriptionText: String
    let permalink: String
    let thumbnail: String
    let title: String
    let url: String
    
    let createdAt: Date
    
    let numberOfComments: Int
    let ups: Double

    
    
    private enum CodingKeys: String, CodingKey {
        case data
        case children
        case createdAt = "created_utc"
        case descriptionText = "selftext"
        case numberOfComments = "num_comments"
        case url
        case thumbnail
        case permalink
        case title
        case author
        case ups
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
            .nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        descriptionText = try container.decode(String.self, forKey: .descriptionText)
        numberOfComments = try container.decode(Int.self, forKey: .numberOfComments)
        url = try container.decode(String.self, forKey: .url)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
        permalink = try container.decode(String.self, forKey: .permalink)
        title = try container.decode(String.self, forKey: .title)
        author = try container.decode(String.self, forKey: .author)
        ups = try container.decode(Double.self, forKey: .ups)
        let utc = try container.decode(Int.self, forKey: .createdAt)
        createdAt = Date(timeIntervalSince1970: Double(utc))
    }
}
