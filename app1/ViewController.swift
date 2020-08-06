//
//  ViewController.swift
//  app1
//
//  Created by thuylinh on 7/11/20.
//  Copyright © 2020 thuylinh. All rights reserved.
//

import UIKit
import DKImagePickerController
struct hihi {
    var im : UIImage!
    init(im : UIImage) {
        self.im = im
    }
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
   
    var imagecollection : [UIImage]! = []
     var imagecollection1 : [UIImage]! = []
    var assets = [DKAsset]()
    @IBOutlet weak var collectionview: UICollectionView!
    var pickerController: DKImagePickerController!
    @IBOutlet weak var selectedPhoto: UIImageView!
    var a = [hihi]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.register(UINib(nibName: "CollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "collection")
        collectionview.delegate =  self
        collectionview.dataSource = self
    }
    
    @IBAction func tap(_ sender: Any) {
        let pickerController = DKImagePickerController()
        imagecollection.removeAll()
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            print("didSelectAssets")
            print(assets)
            for asset in assets {
                    asset.fetchImage(with: CGSize(width: 200, height: 200)) { (image, if) in
                        self.imagecollection.append(image!)
                    }
                }
            self.imagecollection1.append(contentsOf: self.imagecollection)
                print("get all images method called here")
                print(self.imagecollection.count)
                self.collectionview.reloadData()
            }
        
        self.present(pickerController, animated: true) {}
    }
    @objc public var showsCancelButton = false

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           self.imagecollection1.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! CollectionViewCell
        cell.truyen(image: imagecollection1[indexPath.row])
        return cell
       }
}

