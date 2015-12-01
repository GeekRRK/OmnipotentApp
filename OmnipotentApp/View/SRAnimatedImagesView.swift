//
//  SRAnimatedImagesView.swift
//  OmnipotentApp
//
//  Created by suorui on 15/11/30.
//  Copyright © 2015年 suorui. All rights reserved.
//

import UIKit

protocol SRAnimatedImagesViewDelegate {
    mutating func animatedImagesNumberOfImages(animatedImagesView: SRAnimatedImagesView) -> Int
    mutating func animatedImagesView(animatedImagesView: SRAnimatedImagesView, imageAtIndex: Int) -> UIImage
}

class SRAnimatedImagesView: UIControl {
    //MARK: - constant
    let defaultTimePerImage: CGFloat = 20.0
    let noImageDisplayingIndex: Int = -1
    let imageSwappingAnimationDuration: CGFloat = 2.0
    let imageViewsBorderOffset:Int = 150
    
    //MARK: - properties
    var delegate: SRAnimatedImagesViewDelegate? {
        didSet {
            totalImages = delegate?.animatedImagesNumberOfImages(self)
        }
    }
    
    var timePerImage: NSTimeInterval?
    
    var animating: Bool = false
    var totalImages: Int?
    var currentlyDisplayingImageViewIndex: Int?
    var currentlyDisplayingImageIndex: Int?
    
    var imageViews: NSArray?
    
    var imageSwappingTimer: NSTimer?
    
    
    //MARK: - methods
    func _init() {
        let imageViews = NSMutableArray()
        for _ in 0..<2 {
            let frm = CGRectMake(CGFloat(Double(-imageViewsBorderOffset) * 3.3), CGFloat(-imageViewsBorderOffset), self.bounds.size.width + CGFloat(Double(imageViewsBorderOffset) * 3.3), self.bounds.size.height + CGFloat(imageViewsBorderOffset * 2))
            let imageView = UIImageView(frame: frm)
            
            imageView.autoresizingMask = UIViewAutoresizing.FlexibleWidth.union(.FlexibleHeight)
            imageView.contentMode = .ScaleAspectFill
            imageView.clipsToBounds = false
            addSubview(imageView)
            
            imageViews.addObject(imageView)
        }
        
        self.imageViews = imageViews.copy() as? NSArray
        
        currentlyDisplayingImageIndex = noImageDisplayingIndex
        currentlyDisplayingImageViewIndex = 0
        
        self.timePerImage = NSTimeInterval(defaultTimePerImage)
        
        self.imageSwappingTimer = NSTimer.scheduledTimerWithTimeInterval(self.timePerImage!, target: self, selector: "bringNextImage", userInfo: nil, repeats: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _init()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    func startAnimating() {
        animating = true
        if animating {
            imageSwappingTimer?.fire()
        }
    }
    
    func stopAnimating() {
        if animating {
            imageSwappingTimer?.invalidate()
            imageSwappingTimer = nil
            
            UIView.animateWithDuration(NSTimeInterval(imageSwappingAnimationDuration), delay: 0.0, options: .BeginFromCurrentState, animations: {
                for imageView in (self.imageViews)! {
                    let imgView: UIImageView = imageView as! UIImageView
                    imgView.alpha = 0.0
                }
                }, completion: { (Bool) in
                    self.currentlyDisplayingImageIndex = self.noImageDisplayingIndex
                    self.animating = false
            })
        }
    }
    
    func bringNextImage() {
        let imageViewToHide: UIImageView = (imageViews?.objectAtIndex(currentlyDisplayingImageViewIndex!))! as! UIImageView
        currentlyDisplayingImageViewIndex = currentlyDisplayingImageViewIndex == 0 ? 1 : 0
        
        let imageViewToShow: UIImageView = (imageViews?.objectAtIndex(currentlyDisplayingImageViewIndex!))! as! UIImageView
        var nextImageToShowIndex = currentlyDisplayingImageIndex
        
        repeat {
            nextImageToShowIndex = SRAnimatedImagesView.randomIntBetweenNumber(0, maxNumber: totalImages! - 1)
        } while (nextImageToShowIndex == currentlyDisplayingImageIndex)
        
        currentlyDisplayingImageIndex = nextImageToShowIndex
        imageViewToShow.image = self.delegate?.animatedImagesView(self, imageAtIndex: nextImageToShowIndex!)
        
        let kMovementAndTransitionTimeOffset: CGFloat = 0.1
        
        UIView.animateWithDuration(self.timePerImage! + NSTimeInterval(self.imageSwappingAnimationDuration + kMovementAndTransitionTimeOffset), delay: 0.0, options: UIViewAnimationOptions.BeginFromCurrentState.union(.CurveLinear), animations: {
            let randomTranslationValueX = Int(Double(self.imageViewsBorderOffset) * 3.5) - SRAnimatedImagesView.randomIntBetweenNumber(0, maxNumber: self.imageViewsBorderOffset)
            let randomTranslationValueY = 0
            let translationTransform = CGAffineTransformMakeTranslation(CGFloat(randomTranslationValueX), CGFloat(randomTranslationValueY))
            let randomScaleTransformValue = SRAnimatedImagesView.randomIntBetweenNumber(115, maxNumber: 120) / 100
            let scaleTransform = CGAffineTransformMakeScale(CGFloat(randomScaleTransformValue), CGFloat(randomScaleTransformValue))
            
            imageViewToShow.transform = CGAffineTransformConcat(scaleTransform, translationTransform)
            }, completion: { (Bool) in
                
        })
        
        UIView.animateWithDuration(NSTimeInterval(imageSwappingAnimationDuration), delay: NSTimeInterval(kMovementAndTransitionTimeOffset), options: UIViewAnimationOptions.BeginFromCurrentState.union(.CurveLinear), animations: {
            imageViewToShow.alpha = 1.0
                imageViewToHide.alpha = 0.0
            }, completion: { (finished: Bool) in
                if finished {
                    imageViewToHide.transform = CGAffineTransformIdentity
                }
        })
        
    }
    
    func reloadData() {
        totalImages = self.delegate?.animatedImagesNumberOfImages(self)
        self.imageSwappingTimer?.fire()
    }
    
    class func randomIntBetweenNumber(minNumber: Int, maxNumber: Int) -> Int {
        if minNumber > maxNumber {
            return randomIntBetweenNumber(maxNumber, maxNumber: minNumber)
        }
        
        let range: UInt32 = UInt32(maxNumber) - UInt32(minNumber) + 1
        let arc: UInt32 = arc4random()
        let i = (arc % range) + UInt32(minNumber)
        
        return Int(i)
    }
    
    deinit {
        self.imageSwappingTimer?.invalidate()
    }
}