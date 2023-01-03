//
//  UIView+Extension.swift
//  Yummie
//
//  Created by Alonso Alas on 17/12/22.
//

import Foundation
import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
       get{ return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
