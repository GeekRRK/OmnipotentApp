//
//  SRUnderlineTextField.swift
//  OmnipotentApp
//
//  Created by suorui on 15/11/30.
//  Copyright © 2015年 suorui. All rights reserved.
//

import UIKit

class SRUnderlineTextField: UITextField {
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        //Get the current drawing context
        let context: CGContextRef = UIGraphicsGetCurrentContext()!;
        
        //Set the line color and width
        CGContextSetStrokeColorWithColor(context, UIColor(red: 161, green: 163, blue: 168, alpha: 0.2).CGColor);
        CGContextSetLineWidth(context, 1.0);
        
        //Start a new Path
        CGContextBeginPath(context);
        
        //Find the number of lines in our textView + add a bit more height to draw lines in the empty part of the view
        //NSUInteger numberOfLines = (self.contentSize.height + self.bounds.size.height) / self.font.leading;
        
        //Set the line offset from the baseline. (I'm sure there's a concrete way to calculate this.)
        let baselineOffset: CGFloat = frame.size.height;
        
        //iterate over numberOfLines and draw each line
        //for (int x = 1; x < numberOfLines; x++) {
        
        //0.5f offset lines up line with pixel boundary
        CGContextMoveToPoint(context, self.bounds.origin.x, baselineOffset);
        CGContextAddLineToPoint(context, self.bounds.size.width - 10, baselineOffset);
        
        //Close our Path and Stroke (draw) it
        CGContextClosePath(context);
        CGContextStrokePath(context);
    }

}
