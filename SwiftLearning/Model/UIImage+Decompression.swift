//
//  UIImage+Decompression.swift
//  SwiftLearning
//
//  Created by Al on 6/13/17.
//  Copyright © 2017 GeekRRK. All rights reserved.
//

import UIKit

extension UIImage {
    var decompressedImage: UIImage {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        draw(at: CGPoint.zero)
        let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return decompressedImage!
    }
}
