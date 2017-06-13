//
//  RoundedCornersView.swift
//  SwiftLearning
//
//  Created by Al on 6/13/17.
//  Copyright © 2017 GeekRRK. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornersView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

}
