//
//  SRCommon.swift
//  OmnipotentApp
//
//  Created by GeekRRK on 15/12/4.
//  Copyright © 2015年 GeekRRK. All rights reserved.
//

import UIKit

let SCREENWITH = UIScreen.mainScreen().bounds.size.width
let SCREENHEIGHT = UIScreen.mainScreen().bounds.size.height
let ISIPHONE = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone
let IPHONE4S = ISIPHONE && SCREENHEIGHT <= 480.0 ? true : false

let COLOR_UNDERLINE_WHITE = UIColor(red: 161, green: 163, blue: 168, alpha: 0.2)
let COLOR_LOGINBTN_NORMAL = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 0.6)
let COLOR_LOGINBTN_HIGHTED = UIColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 0.8)

let APPDELEGATE = UIApplication.sharedApplication().delegate as! AppDelegate
let STORY = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())

class SRUtil: NSObject {
    
    class func customizeNavBar(navBar: UINavigationBar?) {
        //Make navigationbar transparent.
        let navClearBkg = UIImage(named: "TransparentPixel")
        navBar?.setBackgroundImage(navClearBkg, forBarMetrics: .Default)
        navBar?.shadowImage = navClearBkg
    }
    
    class func deCustomizeNavBar(navBar: UINavigationBar?) {
        navBar?.setBackgroundImage(nil, forBarMetrics: .Default)
        navBar?.shadowImage = nil
    }
    
    class func createImageWithColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    class func createGradientColorWith(fromColor: UIColor, toColor: UIColor, view: UIView) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [fromColor.CGColor, toColor.CGColor]
        view.layer.insertSublayer(gradient, atIndex: 0)
    }
    
    class func kUIColorFromRGB(rgbValue: Int) -> UIColor{
        return UIColor(
            red: CGFloat(Double(((rgbValue & 0xFF0000) >> 16)) / 255.0),
            green: CGFloat(Double(((rgbValue & 0xFF00) >> 8)) / 255.0),
            blue: CGFloat(Double(rgbValue & 0xFF) / 255.0),
            alpha: 1.0
        )
    }
}
