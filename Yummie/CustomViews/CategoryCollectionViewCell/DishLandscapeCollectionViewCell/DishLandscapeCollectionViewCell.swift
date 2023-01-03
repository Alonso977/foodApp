//
//  DishLandscapeCollectionViewCell.swift
//  Yummie
//
//  Created by Alonso Alas on 18/12/22.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {

    static var identifier = String(describing: DishLandscapeCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    
    
    func setup(dish: DishModel) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.title
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.formattedCalories
    }

}
