//
//  GamePresenter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation
// ref to interactor, router, view


class GamePresenter: GamePresenterPropertiesProtocol {
    
    weak var viewController: GamePresenterToViewProtocol?
    var interactor: GamePresenterToInteractorProtocol?
    var router: GamePresenterToRouterProtocol?
    

}

extension GamePresenter: GameViewToPresenterProtocol {
    func fetchData() {
        interactor?.fetchData()
    }
    
    
}

extension GamePresenter: GameInteractorToPresenterProtocol {
    func fetchDataSuccess() {
        viewController?.showView()
    }
    
    func fetchDataFailed() {
        viewController?.showError()
    }
    
    
}
