//
//  DishModel.swift
//  Yummie
//
//  Created by Alonso Alas on 18/12/22.
//

import Foundation

struct DishModel: Decodable{
    
    let id, title, description, image: String?
    let calories: Double?
    
    enum CodingKeys :String, CodingKey {
        case title = "name"
        case id
        case description
        case image
        case calories
    }
    
    var formattedCalories : String {
        return String(format: "%.2f calories", calories ?? 0)
    }
}
