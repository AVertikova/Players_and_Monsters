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
    func attackButtonTapped(attackRequest: GetGameData.AttackRequest)
    func healButtonTapped()
}

protocol GamePresenterToViewResponseProtocol: AnyObject {
    func showView(dataToDisplay: String)
    func showNoHealPillsView(dataToDisplay: String)
    func showGameOver(dataToDisplay: String)
}

protocol GamePresenterToInteractorRequestProtocol: AnyObject {
    func attackButtonTapped(attackRequest: GetGameData.AttackRequest)
    func monsterTurnToAttack()
    func healButtonTapped()
    func initGame(request: GetGameData.GameInitRequest)
}

protocol GameInteractorToPresenterResponseProtocol: AnyObject {
    func fetchGameData(response: GetGameData.Response)
    func fetchAttackResult(response: GetGameData.Response)
    func fetchAttackInfo(response: GetGameData.Response)
    func fetchAttackSuccess(response: GetGameData.Response)
    func fetchAttackFail()
    func fetchHealSuccess(response: GetGameData.Response)
    func fetchHealFail(response: GetGameData.Response)
    func fetchGameOver(response: GetGameData.Response)
    
 
}

protocol GamePresenterToRouterRequestProtocol: AnyObject {
}

