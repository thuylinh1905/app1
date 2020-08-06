//
//  CollectionViewCell.swift
//  app1
//
//  Created by thuylinh on 8/6/20.
//  Copyright © 2020 thuylinh. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var anh: UIImageView!
    func truyen(image : UIImage) {
        self.anh.image = image
    }

}
