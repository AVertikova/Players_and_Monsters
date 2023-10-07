//
//  GameProcessBuilder.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation

class GameBuilder {
    static func createModule() -> GameViewController {
        print("Game Module Creation")
        let gameViewController = GameViewController()
        let presenter: GamePresenterPropertiesProtocol & GameViewToPresenterProtocol & GameInteractorToPresenterProtocol = GamePresenter()
        let interactor: GameInteractorPropertiesProtocol & GamePresenterToInteractorProtocol = GameInteractor()
        let router: GamePresenterToRouterProtocol = GameRouter()
        
        gameViewController.presenter = presenter
        presenter.viewController = gameViewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return gameViewController
    }
}
