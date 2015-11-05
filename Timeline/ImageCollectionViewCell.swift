//
//  ImageCollectionViewCell.swift
//  Timeline
//
//  Created by Jay Maloney on 11/5/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    
    func updateWithImageIdentifier(identifier: String) {
        ImageController.imageForIdentifier(identifier) { (image) -> Void in
//            self.imageView.image = image
        }
    }
    
}
