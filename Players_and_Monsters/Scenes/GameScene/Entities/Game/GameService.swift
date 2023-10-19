//
//  GameService.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import Foundation

typealias AttackInfo = (attacker: String,
                        defender: String,
                        attackPower: UInt,
                        defensePower: UInt,
                        attackModifier: UInt)

typealias AttackResult = (attackSuccess: Bool,
                          damage: UInt,
                          defenderHealth: UInt,
                          gameOver: Bool,
                          monsterHealed: Bool)

typealias PlayerHealResult = (healSuccess: Bool,
                              currentHealth: UInt,
                              healPills: UInt)

protocol GameServicePropertiesProtocol {
    var gameFactory: GameFactory {get}
    var game: Game {get}
    var currentAttackInfo: AttackInfo? {get}
    var currentAttackResult: AttackResult? {get}
    var playerHealResult: PlayerHealResult? {get}
}

protocol GameServiceProtocol {
    func attack(attackRequest: GetGameData.AttackRequest) -> (GetGameData.Response)
    func healPlayer() -> (GetGameData.Response)
}



class GameService: GameServicePropertiesProtocol {
    internal var currentAttackInfo: AttackInfo?
    internal var currentAttackResult: AttackResult?
    internal var playerHealResult: PlayerHealResult?
    
    internal let gameFactory = GameFactory()
    internal let game: Game
    
    init (playerName: String, monsterType: String) {
        game = gameFactory.createNewGame(playerName: playerName, monsterType: monsterType)
    }
}


extension GameService: GameServiceProtocol {
    
    func attack(attackRequest: GetGameData.AttackRequest) -> (GetGameData.Response) {
        let attackResult = game.attack(attackRequest: attackRequest)
        self.currentAttackInfo = attackResult.attackInfo
        self.currentAttackResult = attackResult.AttackResult
        return GetGameData.Response(gameService: self)
    }
    
    func healPlayer() -> (GetGameData.Response) {
        let playerHealResult = game.healPlayer()
        self.playerHealResult = playerHealResult
        return GetGameData.Response(gameService: self)
    }
}
