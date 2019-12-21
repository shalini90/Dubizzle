//
//  CachedImageView.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 19/12/19.
//  Copyright © Shalini Padmanabhan All rights reserved.
//

import UIKit

/**
 A convenient UIImageView to load and cache images.
 */
@objcMembers
class CachedImageView: UIImageView {
    
    static let imageCache = NSCache<NSString, DiscardableImageCacheItem>()
    
    var shouldUseEmptyImage = true
    
    private var urlStringForChecking: String?
    
    @objc func handleTap() {
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     Easily load an image from a URL string and cache it to reduce network overhead later.
     
     - parameter urlString: The url location of your image, usually on a remote server somewhere.
     - parameter completion: Optionally execute some task after the image download completes
     */

    open func loadImage(urlString: String,
                        placeholderImage: UIImage,
                        completion: ((String, UIImage?) -> Void)?) {
        image = nil
        
        self.urlStringForChecking = urlString
        
        let urlKey = urlString as NSString
        
        if let cachedItem = CachedImageView.imageCache.object(forKey: urlKey) {
            image = cachedItem.image
            completion?(urlString, image)
            return
        } else if shouldUseEmptyImage {
            image = placeholderImage
        }
       
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, response, error) in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    let cacheItem = DiscardableImageCacheItem(image: image)
                    CachedImageView.imageCache.setObject(cacheItem, forKey: urlKey)
                    
                    if urlString == self?.urlStringForChecking {
                        completion?(urlString, image)
                    }
                }
            }
            
            }).resume()
    }
}
