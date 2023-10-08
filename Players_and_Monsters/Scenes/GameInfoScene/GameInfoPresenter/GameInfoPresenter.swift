//
//  GameInfoPresenter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import Foundation
import UIKit

class GameInfoPresenter: GameInfoPresenterPropertiesProtocol {
    weak var viewController: GameInfoPresenterToViewResponseProtocol?
    var interactor: GameInfoPresenterToInteractorRequestProtocol?
    var router: GameInfoPresenterToRouterRequestProtocol?
    
    
}

extension GameInfoPresenter: GameInfoViewToPresenterRequestProtocol {
    
    func fetchData() {
        print("GameInfoPresenter: Got request from View to fetch Data. Presenter Will now ask Interactor to do so")
        interactor?.fetchData()
    }
    
    func startGameButtonTapped(navigationController: UINavigationController) {
        print("GameInfoPresenter: View told presenter that button has been tapped. Now Presenter will tell Router to perform required actions")
        router?.pushToGameScene(navigationController: navigationController)
    }
    
    
}

extension GameInfoPresenter: GameInfoInteractorToPresenterResponseProtocol {
    func fetchDataSuccess() {
        print("GameInfoPresenter: Interactor has successfully given Presenter the data. Now Presenter will tell View to show everything it has")
        viewController?.showView()
    }
    
    func fetchDataFailed() {
        print("GameInfoPresenter: Interactor has successfully told Presenter that the data fetch has failed. Now Presenter will tell View to show error")
        viewController?.showError()
    }
    
    
}
                                    
