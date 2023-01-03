//
//  Route.swift
//  Yummie
//
//  Created by Alonso Alas on 26/12/22.
//

import Foundation
import SwiftUI

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case fecthAllCategories
    case placeOrder(String)
    case listCategory(String)
    case fetchOrders
    
    
    var description: String {
        switch self {
            
        case .fecthAllCategories: return "/dish-categories"
        case .placeOrder(let dishId): return "/orders/\(dishId)"
        case .listCategory(let categoryId): return "/dishes/\(categoryId)"
        case .fetchOrders: return "/orders"
            
        }
    }
    
}
