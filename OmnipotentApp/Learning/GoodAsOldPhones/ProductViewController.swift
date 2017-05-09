//
//  ProdoctViewController.swift
//  OmnipotentApp
//
//  Created by Al on 5/7/17.
//  Copyright © 2017 suorui. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productNameLabel.text = product?.name
        
        if let imageName = product?.fullscreenImageName {
            productImageView.image = UIImage(named: imageName)
        }
    }

    @IBAction func addToCartPressed(_ sender: Any) {
        print("Hello world")
    }
}
