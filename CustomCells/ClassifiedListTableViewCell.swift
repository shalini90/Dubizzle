//
//  ClassifiedListTableViewCell.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 19/12/19.
//  Copyright © Shalini Padmanabhan All rights reserved.
//

import UIKit

class ClassifiedListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var createdAtLbl: UILabel!
    @IBOutlet private weak var priceLbl: UILabel!
    @IBOutlet private weak var nameLbl: UILabel!
    @IBOutlet private weak var thumbNailImg: CachedImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateList(result: ResultItem) {
        createdAtLbl.text = result.createdAt.date().timeAgoSince()
        priceLbl.text = result.price
        nameLbl.text = result.name
        if let imageURL = result.thumbNailImageUrl {
            thumbNailImg.loadImage(urlString: imageURL, placeholderImage: #imageLiteral(resourceName: "PlaceHolder")) { (url, image) in
                if url == imageURL {
                    self.thumbNailImg.image = image
                }
            }
        }
        print("results \(result.createdAt) \(result.name) \(result.price)")
    }
    
}
