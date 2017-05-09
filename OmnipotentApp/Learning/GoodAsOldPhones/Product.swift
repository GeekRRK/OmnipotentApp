//
//  Product.swift
//  OmnipotentApp
//
//  Created by Al on 5/7/17.
//  Copyright © 2017 suorui. All rights reserved.
//

import Foundation

class Product {
    var name: String?
    var cellImageName: String?
    var fullscreenImageName: String?
    
    init(name: String, cellImageName: String, fullscreenImageName: String) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullscreenImageName = fullscreenImageName
    }
}
