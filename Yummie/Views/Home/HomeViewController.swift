//
//  HomeViewController.swift
//  Yummie
//
//  Created by Alonso Alas on 18/12/22.
//

import UIKit
import SwiftUI
import ProgressHUD

class HomeViewController: UIViewController {
    
    @IBOutlet weak var popularCollectioView: UICollectionView!
    @IBOutlet weak var specialCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories: [DishCategoryModel] = []
    
    var populars: [DishModel] = []
    
    var specials: [DishModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
        specialCollectionView.delegate = self
        specialCollectionView.dataSource = self
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] result in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectioView.reloadData()
                self?.specialCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        //Me he saltado el video #6 (resuelto)
        popularCollectioView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
        specialCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
            
            // aqui va la parte del video #6 (solucionado)
        case popularCollectioView:
            return populars.count
            
        case specialCollectionView:
            return specials.count
            
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
            
            
            //aqui va el apartado del video #6 (solucionado)
        case popularCollectioView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
            
            
        case specialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
            
        default: return UICollectionViewCell()
        }
    }
    
    // implementacion de cuando se le de click a un tarjeta en especifico
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instatiate()
            controller.category = categories[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
            
        }else {
            let controller = DishDetailsViewController.instatiate()
            controller.dish = collectionView == popularCollectioView ? populars[indexPath.row] : specials[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
