//
//  DetailViewController.swift
//  SwiftLearning
//
//  Created by Al on 6/5/17.
//  Copyright © 2017 suorui. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var candyImageView: UIImageView!
    
    var detailCandy: Candy? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let detailCandy = detailCandy {
            if let detailDescriptionLabel = detailDescriptionLabel, let candyImageView = candyImageView {
                detailDescriptionLabel.text = detailCandy.name
                candyImageView.image = UIImage(named: detailCandy.name)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }

}
