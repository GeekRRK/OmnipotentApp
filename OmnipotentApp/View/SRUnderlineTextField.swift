//
//  SRUnderlineTextField.swift
//  OmnipotentApp
//
//  Created by GeekRRK on 15/11/30.
//  Copyright © 2015年 GeekRRK. All rights reserved.
//

import UIKit

class SRUnderlineTextField: UITextField {
    var highlited: Bool?
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        //Get the current drawing context
        let context: CGContextRef = UIGraphicsGetCurrentContext()!;
        
        //Set the line color and width
        if self.highlited == true {
            CGContextSetStrokeColorWithColor(context, COLOR_LOGINBTN_HIGHTED.CGColor);
        } else {
            CGContextSetStrokeColorWithColor(context, COLOR_UNDERLINE_WHITE.CGColor);
        }
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
