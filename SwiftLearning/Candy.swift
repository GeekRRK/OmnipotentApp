//
//  Candy.swift
//  SwiftLearning
//
//  Created by Al on 6/5/17.
//  Copyright © 2017 suorui. All rights reserved.
//

import Foundation

class Candy: NSObject {
    var category: String
    var name: String
    
    init(category: String, name: String) {
        self.category = category
        self.name = name
    }
}
