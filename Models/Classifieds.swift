//
//  Classifieds.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 19/12/19.
//  Copyright © Shalini Padmanabhan All rights reserved.
//

import Foundation
import UIKit


public protocol Mappable: Decodable {
    
}

struct Classifieds: Mappable {
    let results: [Result]
}

extension Classifieds {
    func getClassifiedList() -> [ResultItem] {
        return results.map { (result) -> ResultItem in
            return result.asResultItem()
        }
    }
    
   
}


// MARK: - Result
struct Result: Mappable {
    let createdAt, price, name, uid: String
    let imageIDS: [String]?
    let imageUrls, imageUrlsThumbnails: [String]?
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}

extension Result {
    
    func asResultItem() -> ResultItem {
        return ResultItem(createdAt: createdAt,
                                  price: price,
                                  name: name,
                                  thumbNailImageUrl: imageUrlsThumbnails?.first,
                                  imageIDS: imageIDS,
                                  imageUrls: imageUrls
        )
    }
    
}

struct ResultItem {
    let createdAt, price, name: String
    let thumbNailImageUrl: String?
    let imageIDS: [String]?
    let imageUrls: [String]?
}

extension ResultItem {
    func asResultDetail() -> ResultDetail {
        return ResultDetail(createdAt: createdAt.date().timeAgoSince(),
                            price: price,
                            name: name,
                            imageUrls: imageUrls)
    }
}

@objcMembers
@objc class ResultDetail: NSObject {
    let createdAt, price, name: String
    let imageUrls: [String]?
   
    init(createdAt: String, price: String, name: String, imageUrls: [String]?) {
        self.createdAt = createdAt
        self.price = price
        self.name = name
        self.imageUrls = imageUrls
        super.init()
    }

    
}
