//
//  OrderModel.swift
//  Yummie
//
//  Created by Alonso Alas on 28/12/22.
//

import Foundation

struct OrderModel: Decodable {
    let id, name: String?
    let dish: DishModel?
}
