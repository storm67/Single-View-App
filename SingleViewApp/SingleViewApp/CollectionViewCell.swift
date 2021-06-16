//
//  CollectionViewCell.swift
//  SingleViewApp
//
//  Created by Storm67 on 06.06.2021.
//  Copyright © 2021 Storm67. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: CollectionModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            collectionImage.image = viewModel.image
            nameLabel.text = viewModel.label
        }
    }
    override func awakeFromNib() {
        backgroundColor = #colorLiteral(red: 0.9325281517, green: 0.9325281517, blue: 0.9325281517, alpha: 1)
    }
    
}
