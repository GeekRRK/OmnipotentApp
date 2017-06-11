//
//  LibraryAPI.swift
//  SwiftLearning
//
//  Created by Al on 6/11/17.
//  Copyright © 2017 GeekRRK. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    static let sharedInstance = LibraryAPI()
    
    fileprivate let persistencyManager: PersistencyManger
    fileprivate let httpClient: HTTPClient
    fileprivate let isOnline: Bool
    
    fileprivate override init() {
        persistencyManager = PersistencyManger()
        httpClient = HTTPClient()
        isOnline = false
        
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(LibraryAPI.downloadImage(_:)), name: NSNotification.Name(rawValue: downloadImageNotification), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func getAlbums() -> [Album] {
        return persistencyManager.getAlbums()
    }
    
    func addAlbum(_ album: Album, index: Int) {
        persistencyManager.addAlbums(album, index: index)
        if isOnline {
            let _ = httpClient.postRequest("/api/addAlbum", boy: album.description)
        }
    }
    
    func deleteAlbum(_ index: Int) {
        persistencyManager.deleteAlbumAtIndex(index)
        if isOnline {
            let _ = httpClient.postRequest("/api/deleteAlbum", boy: "\(index)")
        }
    }
    
    func downloadImage(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo as! [String: AnyObject]
        let imageView = userInfo["imageView"] as! UIImageView?
        let coverUrl = userInfo["coverUrl"] as! String
        
        if let imageViewUnWrapped = imageView {
            imageViewUnWrapped.image = persistencyManager.getImage(URL(string: coverUrl)!.lastPathComponent)
            if imageViewUnWrapped.image == nil {
                DispatchQueue.global().async {
                    let downloadImage = self.httpClient.downloadImage(coverUrl as String)
                    DispatchQueue.main.async {
                        imageViewUnWrapped.image = downloadImage
                        self.persistencyManager.saveImage(downloadImage, filename: URL(string: coverUrl)!.lastPathComponent)
                    }
                }
            }
        }
    }
    
    func saveAlbums() {
        persistencyManager.saveAlbums()
    }
}
