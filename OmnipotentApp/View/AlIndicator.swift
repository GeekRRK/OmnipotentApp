//
//  AlIndicator.swift
//  OmnipotentApp
//
//  Created by suorui on 2/19/16.
//  Copyright © 2016 suorui. All rights reserved.
//

import UIKit

class AlIndicator: NSObject {
    
    static let sharedInstance = AlIndicator()
    
    var bkgView: UIView?
    var indicator: UIActivityIndicatorView?

    func showIndicator(block: dispatch_block_t, completion: () -> Void) {
        let keyWindow = UIApplication.sharedApplication().delegate?.window
        
        if bkgView == nil {
            bkgView = UIView(frame: keyWindow!!.rootViewController!.view.bounds)
            bkgView?.backgroundColor = UIColor.whiteColor()
            bkgView?.alpha = 0.5
            keyWindow!!.addSubview(bkgView!)
        }
        
        if indicator == nil {
            indicator = UIActivityIndicatorView()
            indicator?.color = UIColor.grayColor()
            indicator?.center = (keyWindow!!.rootViewController?.view.center)!
            bkgView?.addSubview(indicator!)
        }
        
        keyWindow!!.bringSubviewToFront(bkgView!)
        bkgView?.hidden = false
        indicator?.hidden = false
        indicator?.startAnimating()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            block()
            
            dispatch_async(dispatch_get_main_queue()) {
                [unowned self] () in
                
                self.indicator?.stopAnimating()
                self.indicator?.hidden = true
                self.bkgView?.hidden = true
                
                completion()
            }
        }
    }
}
