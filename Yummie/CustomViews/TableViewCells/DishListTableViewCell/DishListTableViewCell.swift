//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by Alonso Alas on 22/12/22.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    static let identifier = "DishListTableViewCell"
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    func setup(dish: DishModel) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.title
        descriptionLbl.text = dish.description
    }
    
    func setup(order: OrderModel) {
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLbl.text = order.dish?.title
        descriptionLbl.text = order.name
    }
    
}
