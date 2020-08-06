//
//  ViewController.swift
//  app1
//
//  Created by thuylinh on 7/11/20.
//  Copyright © 2020 thuylinh. All rights reserved.
//

import UIKit
import DKImagePickerController

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
   
    var imagecollection : [UIImage]! = []
    var assets:[DKAsset] = []
    @IBOutlet weak var collectionview: UICollectionView!
    var pickerController: DKImagePickerController!
    @IBOutlet weak var selectedPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "collection")
        collectionview.delegate =  self
        collectionview.dataSource = self
    }
    
    @IBAction func tap(_ sender: Any) {
        let pickerController = DKImagePickerController()
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            print("didSelectAssets")
            print(assets)
             pickerController.showsCancelButton = true
            if assets.count != 0 {
                for asset in assets {
                    self.assets = assets
                    asset.fetchImage(with: CGSize(width: 200, height: 200)) { (image, if) in
                        if let img = image{
                            self.selectedPhoto.image = img
                            self.imagecollection.append(img)
                       }
                    }
                }
                print("get all images method called here")
                print(self.imagecollection.count)
                self.collectionview.reloadData()
            }
            }
        self.present(pickerController, animated: true) {}
    }
    @objc public var showsCancelButton = false

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           self.imagecollection.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! CollectionViewCell
        cell.truyen(image: imagecollection[indexPath.row])
        return cell
       }
}

