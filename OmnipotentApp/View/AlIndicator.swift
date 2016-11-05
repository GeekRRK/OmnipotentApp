//
//  AlIndicator.swift
//  OmnipotentApp
//
//  Created by GeekRRK on 2/19/16.
//  Copyright © 2016 GeekRRK. All rights reserved.
//

import UIKit

class AlIndicator: NSObject {
    
    static let sharedInstance = AlIndicator()
    
    var bkgView: UIView?
    var indicator: UIActivityIndicatorView?

    func showIndicator(_ block: @escaping ()->(), completion: @escaping () -> Void) {
        let keyWindow = UIApplication.shared.delegate?.window
        
        if bkgView == nil {
            bkgView = UIView(frame: keyWindow!!.rootViewController!.view.bounds)
            bkgView?.backgroundColor = UIColor.white
            bkgView?.alpha = 0.5
            keyWindow!!.addSubview(bkgView!)
        }
        
        if indicator == nil {
            indicator = UIActivityIndicatorView()
            indicator?.color = UIColor.gray
            indicator?.center = (keyWindow!!.rootViewController?.view.center)!
            bkgView?.addSubview(indicator!)
        }
        
        keyWindow!!.bringSubview(toFront: bkgView!)
        bkgView?.isHidden = false
        indicator?.isHidden = false
        indicator?.startAnimating()
        
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async {
            block()
            
            DispatchQueue.main.async {
                [unowned self] () in
                
                self.indicator?.stopAnimating()
                self.indicator?.isHidden = true
                self.bkgView?.isHidden = true
                
                completion()
            }
        }
    }
}
