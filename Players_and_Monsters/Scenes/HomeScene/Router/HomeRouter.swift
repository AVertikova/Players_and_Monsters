//
//  HomeRouter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation
import UIKit


class HomeRouter: HomePresenterToRouterRequestProtocol {
    func pushToGameInfoScene(navigationController: UINavigationController) {
        let gameInfoModule = GameInfoBuilder.createModule()
        navigationController.pushViewController(gameInfoModule, animated: true)
    }
}
