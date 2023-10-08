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
        print("HomeRouter: Presenter has asked router to push to catalog")
        print("HomeRouter: Creating Account now")
        let gameInfoModule = GameInfoBuilder.createModule()
        navigationController.pushViewController(gameInfoModule, animated: true)
    }
}
