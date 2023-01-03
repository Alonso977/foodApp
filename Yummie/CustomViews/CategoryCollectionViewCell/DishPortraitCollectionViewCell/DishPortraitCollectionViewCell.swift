//
//  DishPortraitCollectionViewCell.swift
//  Yummie
//
//  Created by Alonso Alas on 20/12/22.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {

    //creando la instancia de identifier
    static var identifier = String(describing: DishPortraitCollectionViewCell.self)
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    func setup(dish: DishModel) {
        titleLbl.text = dish.title
        caloriesLbl.text = dish.formattedCalories
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        descriptionLbl.text = dish.description
    }

}
