//
//  GameService.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import Foundation

typealias CreatureData = (name: String,
                          health: UInt,
                          attackPower: UInt8,
                          defensePower: UInt8,
                          damagePower: UInt8,
                          healPills: UInt8,
                          isAlive: Bool)

protocol GameServicePropertiesProtocol {
    var gameFactory: GameFactory {get}
    var game: Game {get}
}

protocol GameServiceProtocol {
    func getGame() -> Game
    func getPlayerData() -> CreatureData
    func getMonsterData() -> CreatureData
    func getAttackModifier() -> UInt8
    func attack(attacker: String, defender: String) -> Bool
    func heal(isHealing: String)
    func gameOver() -> Bool
}



class GameService: GameServicePropertiesProtocol, GameServiceProtocol {
    func getGame() -> Game {
        return self.game
    }
    
    internal let gameFactory = GameFactory()
    internal let game: Game
    
    
    
    init (playerName: String, monsterType: String) {
        game = gameFactory.createNewGame(playerName: playerName, monsterType: monsterType)
    }
    
    func getPlayerData() -> CreatureData {
        let creatureData: CreatureData = (name: game.player.name,
                                          health: game.player.currentHealth,
                                          attackPower: game.player.attackPower,
                                          defensePower: game.player.defensePower,
                                          damagePower: game.player.damagePower,
                                          healPills: game.player.healPills,
                                          isAlive: game.player.isAlive)
        return creatureData
        
    }
    
    func getMonsterData() -> CreatureData {
        let creatureData: CreatureData = (name: game.monster.name,
                                          health: game.monster.currentHealth,
                                          attackPower: game.monster.attackPower,
                                          defensePower: game.monster.defensePower,
                                          damagePower: game.monster.damagePower,
                                          healPills: game.monster.healPills,
                                          isAlive: game.monster.isAlive)
        return creatureData
        
    }
    
    func getAttackModifier() -> UInt8 {
        return game.attackModifier
    }
    
    func attack(playerAttacks: Bool) -> Bool {
         return playerAttacks == true ? game.makeAttack(attacker: game.player, defender: &game.monster) :
                                       game.makeAttack(attacker: game.monster, defender: &game.player)
    }
    
    func heal(isHealing: String) {
        isHealing == "Player" ? game.player.heal() :
                                game.monster.heal()
        
    }
    
    func gameOver() -> Bool {
        return game.isOver
    }
}
