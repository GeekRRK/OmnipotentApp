//
//  AlbumView.swift
//  SwiftLearning
//
//  Created by Al on 6/11/17.
//  Copyright © 2017 GeekRRK. All rights reserved.
//

import UIKit

class AlbumView: UIView {

    fileprivate var coverImage: UIImageView!
    fileprivate var indicator: UIActivityIndicatorView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(frame: CGRect, albumCover: String) {
        super.init(frame: frame)
        commonInit()
        setupNotification(albumCover)
    }
    
    deinit {
        coverImage.removeObserver(self, forKeyPath: "image")
    }
    
    func commonInit() {
        setupUI()
        setupComponents()
    }
    
    func highlightAlbum(_ didHighlightView: Bool) {
        if didHighlightView {
            backgroundColor = .white
        } else {
            backgroundColor = .black
        }
    }
    
    fileprivate func setupUI() {
        backgroundColor = .blue
    }
    
    fileprivate func setupComponents() {
        coverImage = UIImageView(frame: CGRect(x: 5, y: 5, width: frame.size.width - 10, height: frame.size.height - 10))
        addSubview(coverImage)
        
        indicator = UIActivityIndicatorView()
        indicator.center = center
        indicator.activityIndicatorViewStyle = .whiteLarge
        indicator.startAnimating()
        addSubview(indicator)
        coverImage.addObserver(self, forKeyPath: "image", options: [], context: nil)
    }

    fileprivate func setupNotification(_ albumCover: String) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: downloadImageNotification), object: self, userInfo: ["imageView": coverImage, "coverUrl": albumCover])
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "image" {
            indicator.stopAnimating()
        }
    }
    
}
