//
//  GameService.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import Foundation

typealias CreatureInfo = (name: String,
                          health: UInt,
                          attackPower: UInt,
                          defensePower: UInt,
                          damagePower: UInt,
                          healPills: UInt,
                          isAlive: Bool)

typealias AttackInfo = (attacker: String,
                        defender: String,
                        attackPower: UInt,
                        defensePower: UInt,
                        attackModifier: UInt)

typealias AttackResult = (attackSuccess: Bool,
                          damage: UInt,
                          defenderHealth: UInt,
                          gameOver: Bool)

protocol GameServicePropertiesProtocol {
    var gameFactory: GameFactory {get}
    var game: Game {get}
    var currentAttackInfo: AttackInfo? {get}
    var currentAttackResult: AttackResult? {get}
}

protocol GameServiceProtocol {
    func getPlayerData() -> CreatureInfo
    func getMonsterData() -> CreatureInfo
    func attack(attackRequest: GetGameData.AttackRequest) -> (GetGameData.Response )
    func heal() -> Bool
    func getAttackModifier() -> UInt
}



class GameService: GameServicePropertiesProtocol {
    var currentAttackInfo: AttackInfo?
    var currentAttackResult: AttackResult?
    
    internal let gameFactory = GameFactory()
    internal let game: Game
    
    init (playerName: String, monsterType: String) {
        game = gameFactory.createNewGame(playerName: playerName, monsterType: monsterType)
    }
}


extension GameService: GameServiceProtocol {
    func getAttackModifier() -> UInt {
        return game.attackModifier
    }
    
    
    func getPlayerData() -> CreatureInfo {
        let creatureData: CreatureInfo = (name: game.player.name,
                                          health: game.player.currentHealth,
                                          attackPower: game.player.attackPower,
                                          defensePower: game.player.defensePower,
                                          damagePower: game.player.damagePower,
                                          healPills: game.player.healPills,
                                          isAlive: game.player.isAlive)
        return creatureData
        
    }
    
    func getMonsterData() -> CreatureInfo {
        let creatureData: CreatureInfo = (name: game.monster.name,
                                          health: game.monster.currentHealth,
                                          attackPower: game.monster.attackPower,
                                          defensePower: game.monster.defensePower,
                                          damagePower: game.monster.damagePower,
                                          healPills: game.monster.healPills,
                                          isAlive: game.monster.isAlive)
        return creatureData
        
    }
    
    
    
    func attack(attackRequest: GetGameData.AttackRequest) -> (GetGameData.Response) {
        let attackResult = game.attack(attackRequest: attackRequest)
        self.currentAttackInfo = attackResult.attackInfo
        self.currentAttackResult = attackResult.AttackResult
        return GetGameData.Response(gameService: self)
    }
    
    func heal() -> Bool {
        if game.player.healPills > 0 {
            game.player.healPlayer()
            return true
        } else {
            return false
        }
    }
}
