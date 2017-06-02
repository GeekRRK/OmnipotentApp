//
//  TodoItem.swift
//  OmnipotentApp
//
//  Created by Al on 6/2/17.
//  Copyright © 2017 suorui. All rights reserved.
//

import Foundation

class ToDoItem: NSObject {
    var id: String
    var image: String
    var title: String
    var date: Date
    
    init(id: String, image: String, title: String, date: Date) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}
