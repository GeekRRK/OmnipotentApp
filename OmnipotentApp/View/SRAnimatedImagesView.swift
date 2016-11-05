//
//  SRAnimatedImagesView.swift
//  OmnipotentApp
//
//  Created by GeekRRK on 15/11/30.
//  Copyright © 2015年 GeekRRK. All rights reserved.
//

import UIKit

protocol SRAnimatedImagesViewDelegate {
    mutating func animatedImagesNumberOfImages(_ animatedImagesView: SRAnimatedImagesView) -> Int
    mutating func animatedImagesView(_ animatedImagesView: SRAnimatedImagesView, imageAtIndex: Int) -> UIImage
}

class SRAnimatedImagesView: UIView {
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
    
    var timePerImage: TimeInterval?
    
    var animating: Bool = false
    var totalImages: Int?
    var currentlyDisplayingImageViewIndex: Int?
    var currentlyDisplayingImageIndex: Int?
    
    var imageViews: NSArray?
    
    var imageSwappingTimer: Timer?
    
    
    //MARK: - methods
    func _init() {
        let imageViews = NSMutableArray()
        for _ in 0..<2 {
            let frm = CGRect(x: CGFloat(Double(-imageViewsBorderOffset) * 3.3), y: CGFloat(-imageViewsBorderOffset), width: self.bounds.size.width + CGFloat(Double(imageViewsBorderOffset) * 3.3), height: self.bounds.size.height + CGFloat(imageViewsBorderOffset * 2))
            let imageView = UIImageView(frame: frm)
            
            imageView.autoresizingMask = UIViewAutoresizing.flexibleWidth.union(.flexibleHeight)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = false
            addSubview(imageView)
            
            imageViews.add(imageView)
        }
        
        self.imageViews = imageViews.copy() as? NSArray
        
        currentlyDisplayingImageIndex = noImageDisplayingIndex
        currentlyDisplayingImageViewIndex = 0
        
        self.timePerImage = TimeInterval(defaultTimePerImage)
        
        self.imageSwappingTimer = Timer.scheduledTimer(timeInterval: self.timePerImage!, target: self, selector: #selector(SRAnimatedImagesView.bringNextImage), userInfo: nil, repeats: true)
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
            
            UIView.animate(withDuration: TimeInterval(imageSwappingAnimationDuration), delay: 0.0, options: .beginFromCurrentState, animations: {
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
        let imageViewToHide: UIImageView = (imageViews?.object(at: currentlyDisplayingImageViewIndex!))! as! UIImageView
        currentlyDisplayingImageViewIndex = currentlyDisplayingImageViewIndex == 0 ? 1 : 0
        
        let imageViewToShow: UIImageView = (imageViews?.object(at: currentlyDisplayingImageViewIndex!))! as! UIImageView
        var nextImageToShowIndex = currentlyDisplayingImageIndex
        
        repeat {
            nextImageToShowIndex = SRAnimatedImagesView.randomIntBetweenNumber(0, maxNumber: totalImages! - 1)
        } while (nextImageToShowIndex == currentlyDisplayingImageIndex)
        
        currentlyDisplayingImageIndex = nextImageToShowIndex
        imageViewToShow.image = self.delegate?.animatedImagesView(self, imageAtIndex: nextImageToShowIndex!)
        
        let kMovementAndTransitionTimeOffset: CGFloat = 0.1
        
        UIView.animate(withDuration: self.timePerImage! + TimeInterval(self.imageSwappingAnimationDuration + kMovementAndTransitionTimeOffset), delay: 0.0, options: UIViewAnimationOptions.beginFromCurrentState.union(.curveLinear), animations: {
            let randomTranslationValueX = Int(Double(self.imageViewsBorderOffset) * 3.5) - SRAnimatedImagesView.randomIntBetweenNumber(0, maxNumber: self.imageViewsBorderOffset)
            let randomTranslationValueY = 0
            let translationTransform = CGAffineTransform(translationX: CGFloat(randomTranslationValueX), y: CGFloat(randomTranslationValueY))
            let randomScaleTransformValue = SRAnimatedImagesView.randomIntBetweenNumber(115, maxNumber: 120) / 100
            let scaleTransform = CGAffineTransform(scaleX: CGFloat(randomScaleTransformValue), y: CGFloat(randomScaleTransformValue))
            
            imageViewToShow.transform = scaleTransform.concatenating(translationTransform)
            }, completion: { (Bool) in
                
        })
        
        UIView.animate(withDuration: TimeInterval(imageSwappingAnimationDuration), delay: TimeInterval(kMovementAndTransitionTimeOffset), options: UIViewAnimationOptions.beginFromCurrentState.union(.curveLinear), animations: {
            imageViewToShow.alpha = 1.0
                imageViewToHide.alpha = 0.0
            }, completion: { (finished: Bool) in
                if finished {
                    imageViewToHide.transform = CGAffineTransform.identity
                }
        })
        
    }
    
    func reloadData() {
        totalImages = self.delegate?.animatedImagesNumberOfImages(self)
        self.imageSwappingTimer?.fire()
    }
    
    class func randomIntBetweenNumber(_ minNumber: Int, maxNumber: Int) -> Int {
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
