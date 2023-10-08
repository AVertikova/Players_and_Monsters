//
//  GamePresenter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation
import UIKit


class GamePresenter: GamePresenterPropertiesProtocol {
    
    weak var viewController: GamePresenterToViewResponseProtocol?
    var interactor: GamePresenterToInteractorRequestProtocol?
    var router: GamePresenterToRouterRequestProtocol?
    

}

extension GamePresenter: GameViewToPresenterRequestProtocol {
    func fetchData() {
        interactor?.fetchData()
    }
    
}

extension GamePresenter: GameInteractorToPresenterResponseProtocol {
    func fetchDataSuccess() {
        viewController?.showView()
    }
    
    func fetchDataFailed() {
        viewController?.showError()
    }
    
    
}
