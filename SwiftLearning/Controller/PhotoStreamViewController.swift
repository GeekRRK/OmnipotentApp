//
//  PhotoStreamViewController.swift
//  SwiftLearning
//
//  Created by Al on 6/13/17.
//  Copyright © 2017 GeekRRK. All rights reserved.
//

import UIKit
import AVFoundation

class PhotoStreamViewController: UICollectionViewController {
    
    var photos = Photo.allPhotos()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        
        collectionView?.backgroundColor = .clear
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
    }

}

extension PhotoStreamViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath) as! AnnotatedPhotoCell
        cell.photo = photos[(indexPath as NSIndexPath).item]
        return cell
    }
}

extension PhotoStreamViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        let photo = photos[(indexPath as NSIndexPath).item]
        let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect  = AVMakeRect(aspectRatio: photo.image.size, insideRect: boundingRect)
        return rect.size.height
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let annotationPadding = CGFloat(4)
        let annotationHeaderHeight = CGFloat(17)
        let photo = photos[(indexPath as NSIndexPath).item]
        let font = UIFont(name: "AvenirNext-Regular", size: 10)!
        let commentHeight = photo.heightForComment(font, width: width)
        let height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding
        return height
    }
}
