//
//  ListingViewModel.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 6/27/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation
import UIKit

struct ListingCellViewModel {
    private let listing: Listing
    
    init(listing: Listing) {
        self.listing = listing
    }
    
    func configure(cell: ListingCollectionViewCell) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "EST")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        cell.titleLabel.text = listing.title

//        // CONFIGURE CELL WITH PROPERTIES
        cell.authorLabel.text = "/u/" + listing.author
        let comments = listing.numberOfComments.formatNumber(Int(listing.numberOfComments))
        cell.numberOfCommentsLabel.text = "\(comments) comments"
        cell.upsLabel.text =  listing.ups.formatNumber(Int(listing.ups))
        cell.createdAtLabel.text = dateFormatter.string(from: listing.createdAt)
        
        if(listing.thumbnail != "") {
            cell.thumbnailImage.downloaded(from: listing.thumbnail)
        } 
        

    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    // convert date to string
    // show author in correct format
    // calculate upvotes to display with decimal shit
    // create string for comment
    // load thumbnail image for cell, if not thumbnail, use a default image
}
