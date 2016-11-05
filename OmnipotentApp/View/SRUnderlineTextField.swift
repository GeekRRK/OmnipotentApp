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
    override func draw(_ rect: CGRect) {
        
        //Get the current drawing context
        let context: CGContext = UIGraphicsGetCurrentContext()!;
        
        //Set the line color and width
        if self.highlited == true {
            context.setStrokeColor(COLOR_LOGINBTN_HIGHTED.cgColor);
        } else {
            context.setStrokeColor(COLOR_UNDERLINE_WHITE.cgColor);
        }
        context.setLineWidth(1.0);
        
        //Start a new Path
        context.beginPath();
        
        //Find the number of lines in our textView + add a bit more height to draw lines in the empty part of the view
        //NSUInteger numberOfLines = (self.contentSize.height + self.bounds.size.height) / self.font.leading;
        
        //Set the line offset from the baseline. (I'm sure there's a concrete way to calculate this.)
        let baselineOffset: CGFloat = frame.size.height;
        
        //iterate over numberOfLines and draw each line
        //for (int x = 1; x < numberOfLines; x++) {
        
        //0.5f offset lines up line with pixel boundary
        context.move(to: CGPoint(x: self.bounds.origin.x, y: baselineOffset));
        context.addLine(to: CGPoint(x: self.bounds.size.width - 10, y: baselineOffset));
        
        //Close our Path and Stroke (draw) it
        context.closePath();
        context.strokePath();
    }
}
