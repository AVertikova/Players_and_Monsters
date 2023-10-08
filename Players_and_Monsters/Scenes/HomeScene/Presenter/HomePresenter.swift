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
    
    func fetchData() {
        print("HomePresenter: Got request from View to fetch Data. HomePresenter Will now ask Interactor to do so")
       interactor?.fetchData()
    }
    
    func continueButtonTapped(navigationController: UINavigationController) {
        print("HomePresenter: View told presenter that button has been tapped. Now HomePresenter will tell Router to perform required actions")
        interactor.createGame(playerName: viewController.playerNameTextField.text, monsterType: viewController.enemyTextField.text)
        router?.pushToGameInfoScene(navigationController: navigationController)
    }
    
}
extension HomePresenter: HomeInteractorToPresenterResponseProtocol {
    func fetchDataSuccess(monsterTypes: [String]) {
        print("HomePresenter: Interactor has successfully given HomePresenter the data. Now HomePresenter will tell View to show everything it has")
        viewController?.showView(monsterTypes: monsterTypes)
    }
    
    func fetchDataFailed() {
        print("HomePresenter: Interactor has successfully told HomePresenter that the data fetch has failed. Now HomePresenter will tell View to show error")
        viewController?.showError()
    }
    
    
}
