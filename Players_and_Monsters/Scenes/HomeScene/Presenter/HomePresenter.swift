//
//  HomePresenter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation
import UIKit




class HomePresenter: HomePresenterPropertiesProtocol {
    weak var viewController: HomePresenterToViewResponseProtocol?
    var interactor: HomePresenterToInteractorRequestProtocol?
    var router: HomePresenterToRouterRequestProtocol?
    
   
}

extension HomePresenter: HomeViewToPresenterRequestProtocol {
    func saveChoice(playerName: String, monsterType: String) {
        interactor?.saveChoice(playerName: playerName, monsterType: monsterType)
    }
    
    func fetchChoiceData(request: GetHomeData.Request) {
       interactor?.fetchChoiceData(request: request)
    }
    
    
    func continueButtonTapped(navigationController: UINavigationController) {
        router?.pushToGameInfoScene(navigationController: navigationController)
    }
    
}
extension HomePresenter: HomeInteractorToPresenterResponseProtocol {
    
    func fetchChoiceDataSuccess(response: GetHomeData.Response) {
        viewController?.showView(response: response)
    }
    
    func fetchChoiceDataFailed() {
        viewController?.showError()
    }
    
    
}
