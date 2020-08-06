//
//  CustomFlowLayout.swift
//  app1
//
//  Created by thuylinh on 8/6/20.
//  Copyright © 2020 thuylinh. All rights reserved.
//

import Foundation
import DKImagePickerController

open class CustomFlowLayout: UICollectionViewFlowLayout {

open override func prepare() {
    super.prepare()
    
    self.scrollDirection = .horizontal
    
    let contentWidth = self.collectionView!.bounds.width * 0.7
    self.itemSize = CGSize(width: contentWidth, height: contentWidth)
    
    self.minimumInteritemSpacing = 999
}
}
