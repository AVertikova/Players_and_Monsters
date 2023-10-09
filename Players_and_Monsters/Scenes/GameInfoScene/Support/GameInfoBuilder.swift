//
//  GameInfoBuilder.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import Foundation
import UIKit

class GameInfoBuilder {
    static func createModule() -> GameInfoViewController {
        let gameInfoViewController =  UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "GameInfoViewController") as! GameInfoViewController
        let presenter: GameInfoPresenterPropertiesProtocol & GameInfoViewToPresenterRequestProtocol & GameInfoInteractorToPresenterResponseProtocol = GameInfoPresenter()
        let interactor: GameInfoInteractorPropertiesProtocol & GameInfoPresenterToInteractorRequestProtocol = GameInfoInteractor()
        let router: GameInfoPresenterToRouterRequestProtocol = GameInfoRouter()
      
        gameInfoViewController.presenter = presenter
       
        presenter.viewController = gameInfoViewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return gameInfoViewController
    }
}
