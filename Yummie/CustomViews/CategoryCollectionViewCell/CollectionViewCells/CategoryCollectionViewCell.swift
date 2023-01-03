//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Alonso Alas on 18/12/22.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static var identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    func setup(category: DishCategoryModel) {
        categoryImageView.kf.setImage(with: category.image.asUrl)
        categoryTitleLbl.text = category.title
        
    }
    
    
    
}
