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
        currentGame?.attack(playerAttacks: playerAttacks)
    }
    
    func fetchAttackSucces() {
       
    }
    
    func fetchAttackFail() {
        
    }
}
