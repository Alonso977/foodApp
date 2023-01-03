//
//  ApiResponse.swift
//  Yummie
//
//  Created by Alonso Alas on 27/12/22.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
