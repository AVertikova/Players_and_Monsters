//
//  HomePresenter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation
import UIKit

protocol HomePresentationLogic: AnyObject {
    func fetchData()
    func startGamebuttonTapped(navigationController: UINavigationController)
}

class HomePresenter {
    weak var view: HomeDisplayLogic?
   
}

extension HomePresenter: HomePresentationLogic {
    
    func fetchData() {

    }
    
    func startGamebuttonTapped(navigationController: UINavigationController) {
        
    }
    
    
    
}
