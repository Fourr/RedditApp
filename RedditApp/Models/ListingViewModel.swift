//
//  ListingViewModel.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 6/27/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation


struct ListingCellViewModel {
    private let listing: Listing
    
    init(listing: Listing) {
        self.listing = listing
    }
    
    func configure(cell: ListingCollectionViewCell) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "EST")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

//        // CONFIGURE CELL WITH PROPERTIES
        cell.authorLabel.text = "/u/" + listing.author
        cell.numberOfComments.text = "\(listing.numberOfComments) comments"
//        if listing.thumbnail == "" {
//
//        } else {
//            cell.thumbnail = listing.thumbnail
//        }
        cell.titleLabel.text = listing.title
        cell.ups.text =  listing.ups.formatNumber(Int(listing.ups))
        cell.createdAt.text = dateFormatter.string(from: listing.createdAt)

    }
    
    // convert date to string
    // show author in correct format
    // calculate upvotes to display with decimal shit
    // create string for comment
    // load thumbnail image for cell, if not thumbnail, use a default image
}
