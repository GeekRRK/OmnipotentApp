//
//  ProductsTableViewController.swift
//  OmnipotentApp
//
//  Created by Al on 5/7/17.
//  Copyright © 2017 suorui. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    fileprivate var products: [Product]?
    fileprivate let identifier = "productCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = [
            Product(name: "1907 Wall Set", cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1"),
            Product(name: "1921 Dial Phone", cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2"),
            Product(name: "1937 Desk Set", cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3"),
            Product(name: "1984 Moto Portable", cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4")
        ]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let products = products {
            return products.count
        }
        
        return 0
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProduct" {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell), let productVC = segue.destination as? ProductViewController {
                    productVC.product = products?[(indexPath as NSIndexPath).row]
            }
        }
    }

}
