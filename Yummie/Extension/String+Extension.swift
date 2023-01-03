//
//  String+Extension.swift
//  Yummie
//
//  Created by Alonso Alas on 18/12/22.
//

import Foundation


extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
