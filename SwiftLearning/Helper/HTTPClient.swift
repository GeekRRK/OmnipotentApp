//
//  HTTPClient.swift
//  SwiftLearning
//
//  Created by Al on 6/11/17.
//  Copyright © 2017 suorui. All rights reserved.
//

import UIKit

class HTTPClient {
    func getRequest(_ url: String) -> (AnyObject) {
        return Data() as (AnyObject)
    }
    
    func postRequest(_ url: String, boy: String) -> (AnyObject) {
        return Data() as (AnyObject)
    }
    
    func downloadImage(_ url: String) -> (UIImage) {
        let aUrl = URL(string: url)
        guard let data = try? Data(contentsOf: aUrl!) else {
            return UIImage()
        }
        
        let image = UIImage(data: data)
        return image!
    }
}
