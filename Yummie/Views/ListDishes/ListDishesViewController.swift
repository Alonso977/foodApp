//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by Alonso Alas on 23/12/22.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategoryModel!
    
    var dishes: [DishModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.title
        registerCells()
        
        ProgressHUD.show()
        NetworkService.shared.listByCategory(categoryId: category.id) { [weak self] (result) in
            switch result {
            case .success(let catResult):
                ProgressHUD.dismiss()
                self?.dishes = catResult
                self?.tableView.reloadData()
                
            case .failure(let error) :
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}


extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instatiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
