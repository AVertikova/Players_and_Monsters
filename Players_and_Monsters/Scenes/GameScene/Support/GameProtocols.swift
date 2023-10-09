//
//  GameProtocols.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 07.10.2023.
//

import Foundation
import UIKit

// MARK: Game Properties protocols

protocol GameViewPropertiesProtocol: AnyObject {
    var presenter: GameViewToPresenterRequestProtocol? { get set }
}

protocol GamePresenterPropertiesProtocol: AnyObject {
    var viewController: GamePresenterToViewResponseProtocol? { get set }
    var interactor: GamePresenterToInteractorRequestProtocol? { get set }
    var router: GamePresenterToRouterRequestProtocol? { get set }
}

protocol GameInteractorPropertiesProtocol: AnyObject {
    var presenter: GameInteractorToPresenterResponseProtocol? { get set }
}

// MARK: Game Interaction protocols

protocol GameViewToPresenterRequestProtocol: AnyObject {
    func fetchGame(request: GetGameData.GameInitRequest)
    func attackButtonTapped(playerAttacks: Bool)
}

protocol GamePresenterToViewResponseProtocol: AnyObject {
    func showView()
    func showError()
}

protocol GamePresenterToInteractorRequestProtocol: AnyObject {
    func attackButtonTapped(playerAttacks: Bool)
    func initGame(request: GetGameData.GameInitRequest)
    func fetchAttackSucces()
    func fetchAttackFail()
}

protocol GameInteractorToPresenterResponseProtocol: AnyObject {
    func fetchData(response: GetGameData.Response)
 
}

protocol GamePresenterToRouterRequestProtocol: AnyObject {
//    func pushToGameScene(navigationController: UINavigationController)
}

