//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Alonso Alas on 17/12/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    func setup(_ slide: OnboardingSlideModel) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
    
    
    
}
