//
//  Flickr.swift
//  SwiftLearning
//
//  Created by Al on 6/14/17.
//  Copyright © 2017 GeekRRK. All rights reserved.
//

import UIKit

let apiKey = "68235aae25e7a935db219ebce37f5735"

class Flickr {
    let  processingQueue = OperationQueue()
    
    func searchFlickrForTerm(_ searchTerm: String, completion: String: @escaping(_ results: FlickrSearchResults?, _ error: NSError?) -> Void) {
        guard let searchURL = flickrSearchURLForSearchTerm(searchTerm) else {
            let APIError = NSError(domain: "FlickrSearch", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey:"Unknown API response"])
            completion(nil, APIError)
            return
        }
        
        
    }
}
