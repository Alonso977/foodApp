//
//  DishDetailsViewController.swift
//  Yummie
//
//  Created by Alonso Alas on 20/12/22.
//

import UIKit
import ProgressHUD
import Accelerate
class DishDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish: DishModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateView()
        navigationController?.navigationBar.tintColor = .label
        
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.title
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
        
    }

    @IBAction func placeOrderBtnClicked(_ sender: UIButton) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            
            return
        }
        
        ProgressHUD.show("Placing Order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("The order was successfully...🧑🏽‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
}
