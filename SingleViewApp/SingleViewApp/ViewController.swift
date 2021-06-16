//
//  ViewController.swift
//  SingleViewApp
//
//  Created by Storm67 on 12/05/2021.
//  Copyright © 2021 Storm67. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
   
    var collectionModel = [CollectionModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let xib = UINib(nibName: "Cell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        imageUpdater()
    }
    
    func imageUpdater() {
        Images.array.forEach {
            let collection = CollectionModel(image: $0.0, label: $0.1)
            collectionModel.append(collection)
        }
    }
    
    func index(_ index: Int) -> CollectionModel {
        return collectionModel[index]
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        switch indexPath.row {
        case 0:
        let sizeForImage = CGSize(width: 94, height: 63)
            return resizableCell(sizeForImage, &cell, "2", "Дети")
        case 1:
        let sizeForImage = CGSize(width: 71, height: 68)
            return resizableCell(sizeForImage, &cell, "3", "Взрослые")
        case 2:
        let sizeForImage = CGSize(width: 72, height: 77)
            return resizableCell(sizeForImage, &cell, "4", "Пожилые")
        case 3:
        let sizeForImage = CGSize(width: 115, height: 53)
            return resizableCell(sizeForImage, &cell, "5", "Животные")
        case 4:
        let sizeForImage = CGSize(width: 75, height: 45)
            return resizableCell(sizeForImage, &cell, "6", "Мероприятия")
        default:
        return UICollectionViewCell()
        }
    }
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 1114, height: 160);
    }
    
    func resizableCell(_ sizeForImage: CGSize,_ cell: inout CollectionViewCell,_ named: String, _ label: String) -> CollectionViewCell {
        cell.collectionImage.image = UIImage(named: named)?.resizeImage(targetSize: sizeForImage)
        cell.nameLabel.text = label
        return cell
    }
    
}

extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
       let size = self.size
       
       let widthRatio  = targetSize.width  / size.width
       let heightRatio = targetSize.height / size.height
       
       // Figure out what our orientation is, and use that to form the rectangle
       var newSize: CGSize
       if(widthRatio > heightRatio) {
           newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
       } else {
           newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
       }
       
       // This is the rect that we've calculated out and this is what is actually used below
       let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
       
       // Actually do the resizing to the rect using the ImageContext stuff
       UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
       self.draw(in: rect)
       let newImage = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       
       return newImage!
   }
}
