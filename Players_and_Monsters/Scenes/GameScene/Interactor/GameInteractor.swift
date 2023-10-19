//
//  GameInteractor.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation

class GameInteractor: GameInteractorPropertiesProtocol {
    weak var presenter: GameInteractorToPresenterResponseProtocol?
    var currentGame: GameService?
}

extension GameInteractor: GamePresenterToInteractorRequestProtocol {
    
    func initGame(request: GetGameData.GameInitRequest) {
        let playerName = UserDefaults.standard.string(forKey: "playerName") ?? "Неважно"
        let monsterType = UserDefaults.standard.string(forKey: "monsterType") ?? ""
        let response = GetGameData.Response(gameService: GameService(playerName: playerName, monsterType: monsterType))
        currentGame = response.gameService
        //        presenter?.fetchGameData(response: response)
    }
    
    func attackButtonTapped(attackRequest: GetGameData.AttackRequest) {
        if  let response = currentGame?.attack(attackRequest: attackRequest) {
                presenter?.fetchAttackResult(response: response)
            if response.gameService?.currentAttackResult?.gameOver == false {
                monsterTurnToAttack()
            } 
//            else {
//                presenter?.fetchGameOver(response: response)
//            }
            }
            
        }
        
       
        
    
    
    func monsterTurnToAttack() {
        let monsterAttackRequest = GetGameData.AttackRequest(playerAttacks: false)
        if let monsterAttackResponse = currentGame?.attack(attackRequest: monsterAttackRequest) {
            presenter?.fetchAttackResult(response: monsterAttackResponse)
        }
    }
    
    
    
    
    func healButtonTapped() {
        if let response = currentGame?.healPlayer() {
            if response.gameService?.playerHealResult?.healSuccess == true {
                presenter?.fetchPlayerHealSuccess(response: response)
            } else {
                presenter?.fetchPlayerHealFail()
            }
        }
    }
    
}
