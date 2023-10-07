//
//  HomeRouter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation
import UIKit

protocol HomePresenterToRouterRequestProtocol: AnyObject {
    func pushToGameScene(navigationController: UINavigationController)
}


class HomeRouter: HomePresenterToRouterRequestProtocol {
    func pushToGameScene(navigationController: UINavigationController) {
        print("Router: Presenter has asked router to push to catalog")
        print("Router: Creating Account now")
        let gameModule = GameBuilder.createModule()
        navigationController.pushViewController(gameModule, animated: true)
    }
}
