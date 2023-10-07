//
//  GameProcessBuilder.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation
import UIKit

class GameBuilder {
    static func createModule() -> GameViewController {
        print("Game Module Creation")
        let gameViewController =  UIStoryboard(name: "HomeViewController", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
//        let gameViewController = GameViewController()
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
