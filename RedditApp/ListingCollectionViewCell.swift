//
//  ListingCollectionViewCell.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 6/27/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation
import UIKit

final class ListingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var authorLabel: UILabel!
    
    @IBOutlet var numberOfCommentsLabel: UILabel!
    
    @IBOutlet var upsLabel: UILabel!
    
    @IBOutlet var createdAtLabel: UILabel!
    
    @IBOutlet var thumbnailImage: UIImageView!
    
    
    
    //    let titleLabel: UILabel = {
//        let label = UILabel()
//        
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 16)
//        
//        return label
//    }()
//    
//    let createdAt: UILabel = {
//        let label = UILabel()
//        
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 16)
//        
//        return label
//    }()
//    
//    let numberOfComments: UILabel = {
//        let label = UILabel()
//        
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 16)
//        
//        return label
//    }()
//    
//    let ups: UILabel = {
//        let label = UILabel()
//        
//        label.textColor = .black
//        label.font = .systemFont(ofSize: 16)
//        
//        return label
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        contentView.backgroundColor = .white
        configureConstraints()
    }
    
    private func configureConstraints() {
//        authorLabel.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(authorLabel)
//        authorLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
//        authorLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        
        
//       var previous: UILabel?
        
//        for label in [authorLabel, titleLabel, createdAt, numberOfComments, ups] {
//            label.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview(label)
//            label.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
//            label.heightAnchor.constraint(equalToConstant: 20).isActive = true
//            
//            if let previous = previous {
//                // we have a previous label – create a height constraint
//                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
//            } else {
//                // this is the first label
//                label.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//            }
//            
//            // set the previous label to be the current one, for the next loop iteration
//            previous = label
//        }
    
    }
    
    private func configureStyle() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        createdAtLabel.text = nil
        numberOfCommentsLabel.text = nil
        upsLabel.text = nil
    }
}
