//
//  GameFactory.swift
//
//
//  Created by Анна Вертикова on 03.10.2023.
//

import Foundation

protocol GameFactoryProtocol {
    func createNewGame(playerName: String, monsterType: String) -> Game
}

class GameFactory: GameFactoryProtocol {
    
    func createNewGame(playerName: String, monsterType: String) -> Game {
        //     TODO: input validation
        let monsterTypes = [Ogre(), Skeleton(), SabreToothedKitten()]
        switch monsterType {
        case "1":
             return Game(player: Player(name: playerName), monster: Ogre())
        case "2":
            return Game(player: Player(name: playerName), monster: Skeleton())
        case "3":
            return Game(player: Player(name: playerName), monster: SabreToothedKitten())
        case "4":
            return Game(player: Player(name: playerName), monster: monsterTypes.randomElement() ?? Ogre())
        default:
            return Game(player: Player(name: playerName), monster: monsterTypes.randomElement() ?? Ogre())
        }
    }
    
    
}
