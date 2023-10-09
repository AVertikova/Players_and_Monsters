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
    
    func attackButtonTapped(playerAttacks: Bool) {
        interactor?.attackButtonTapped(playerAttacks: playerAttacks)
    }
    
    func fetchGame(request: GetGameData.GameInitRequest) {
        interactor?.initGame(request: request)
    }
    
    
    
}

extension GamePresenter: GameInteractorToPresenterResponseProtocol {
    func fetchData(response: GetGameData.Response) {
//        response.gameService.
        viewController?.showView()
    }
    
    
}
