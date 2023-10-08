//
//  GameInfoRouter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import Foundation
import UIKit

class GameInfoRouter: GameInfoPresenterToRouterRequestProtocol {
    func pushToGameScene(navigationController: UINavigationController) {
        print("GameInfoRouter: Presenter has asked router to push to GAME")
        print("GameInfoRouter: Creating GAME VC now")
        let gameModule = GameBuilder.createModule()
        navigationController.pushViewController(gameModule, animated: true)
    }
    
    
}
