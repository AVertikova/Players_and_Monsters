//
//  GameBuilder.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation
import UIKit

class GameBuilder {
    static func createModule() -> GameViewController {
        let gameViewController =  UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        let presenter: GamePresenterPropertiesProtocol & GameViewToPresenterRequestProtocol & GameInteractorToPresenterResponseProtocol = GamePresenter()
        let interactor: GameInteractorPropertiesProtocol & GamePresenterToInteractorRequestProtocol = GameInteractor()
        let router: GamePresenterToRouterRequestProtocol = GameRouter()
        
        gameViewController.presenter = presenter
        presenter.viewController = gameViewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return gameViewController
    }
}
