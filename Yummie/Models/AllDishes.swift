//
//  AllDishes.swift
//  Yummie
//
//  Created by Alonso Alas on 27/12/22.
//

import Foundation

struct AllDishes:Decodable {
    let categories: [DishCategoryModel]?
    let populars: [DishModel]?
    let specials: [DishModel]?
}
