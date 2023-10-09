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
        presenter?.fetchData(response: response)
    }
    
    func attackButtonTapped(playerAttacks: Bool) {
        let monsterHealth: UInt = currentGame?.getPlayerData().health ?? 0
        let playerHealth: UInt = currentGame?.getMonsterData().health ?? 0
        
        if monsterHealth > 0 && playerHealth > 0 {
            let attackResult = currentGame?.attack(playerAttacks: playerAttacks)
            let damage = attackResult?.damage ?? 1
            if playerAttacks == true {
                if (attackResult?.success == true) {
                    let response = GetGameData.Response(gameService: currentGame)
                    presenter?.fetchAttackSucces(response: response, attacker: "Player", damage: damage)
                    
                } else {
                    presenter?.fetchAttackFail()
                }
            } else {
                if (attackResult?.success == true) {
                    let response = GetGameData.Response(gameService: currentGame)
                    presenter?.fetchAttackSucces(response: response, attacker: "Monster", damage: damage)
                    
                } else {
                    presenter?.fetchAttackFail()
                }
            }
        } else {
            if let playerIsAlive: Bool = currentGame?.getPlayerData().isAlive {
                if playerIsAlive == true {
                    if let playerName: String = currentGame?.getPlayerData().name {
                        presenter?.fetchGameOver(winner: playerName )
                    }
                } else {
                    if let monsterName: String = currentGame?.getMonsterData().name {
                        presenter?.fetchGameOver(winner: monsterName )
                    }
                }
            }
        }
    }
    
    func healButtonTapped() {
        if currentGame?.heal() == true {
            let response = GetGameData.Response(gameService: currentGame)
            presenter?.fetchHealSuccess(response: response)
        } else {
            let response = GetGameData.Response(gameService: currentGame)
            presenter?.fetchHealFail(response: response)
        }
    }
    
}
