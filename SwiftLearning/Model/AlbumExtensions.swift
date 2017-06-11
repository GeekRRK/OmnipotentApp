//
//  AlbumExtensions.swift
//  SwiftLearning
//
//  Created by Al on 6/11/17.
//  Copyright © 2017 GeekRRK. All rights reserved.
//

import UIKit

extension Album {
    func ae_tableRepresentation() -> (titles: [String], values: [String]) {
        return (["Artist", "Album", "Genre", "Year"], [artist, title, genre, year])
    }
}
