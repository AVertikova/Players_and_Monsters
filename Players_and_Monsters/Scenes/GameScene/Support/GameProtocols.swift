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
    func healButtonTapped()
}

protocol GamePresenterToViewResponseProtocol: AnyObject {
    func showView(dataToDisplay: String)
    func showNoHealPillsView(dataToDisplay: String)
    func showGameOver(dataToDisplay: String)
}

protocol GamePresenterToInteractorRequestProtocol: AnyObject {
    func attackButtonTapped(playerAttacks: Bool)
    func healButtonTapped()
    func initGame(request: GetGameData.GameInitRequest)
}

protocol GameInteractorToPresenterResponseProtocol: AnyObject {
    func fetchData(response: GetGameData.Response)
    func fetchAttackDetails(response: GetGameData.Response, attacker: String)
    func fetchAttackSucces(response: GetGameData.Response, attacker: String, damage: UInt)
    func fetchAttackFail()
    func fetchHealSuccess(response: GetGameData.Response)
    func fetchHealFail(response: GetGameData.Response)
    func fetchGameOver(winner: String)
    
 
}

protocol GamePresenterToRouterRequestProtocol: AnyObject {
}

