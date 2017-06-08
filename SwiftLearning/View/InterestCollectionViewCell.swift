//
//  InterestCollectionViewCell.swift
//  SwiftLearning
//
//  Created by Al on 6/8/17.
//  Copyright © 2017 suorui. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - public API
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        titleLabel.text = interest.title
        featuredImageView.image = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
    }
}
