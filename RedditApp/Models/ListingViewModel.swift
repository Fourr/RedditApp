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
        // CONFIGURE CELL WITH PROPERTIES
        cell.author = "/u/" + listing.author
        //cell.createdAt = listing.createdAt
        cell.numberOfComments = "\(listing.numberOfComments) comments"
        if listing.thumbnail == "" {
            
        } else {
            cell.thumbnail = listing.thumbnail
        }
        cell.title = listing.title
        cell.ups =  listing.ups.formatNumber(Int(listing.ups))
    }
    
    // convert date to string
    // show author in correct format
    // calculate upvotes to display with decimal shit
    // create string for comment
    // load thumbnail image for cell, if not thumbnail, use a default image
}
