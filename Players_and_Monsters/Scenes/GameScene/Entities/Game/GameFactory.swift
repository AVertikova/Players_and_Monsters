//
//  GameFactory.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import Foundation

protocol GameFactoryProtocol {
    func createNewGame(playerName: String, monsterType: String) -> Game
}

class GameFactory: GameFactoryProtocol {
 
    func createNewGame(playerName: String, monsterType: String) -> Game {
        var localPlayerName: String = ""
        if playerName.contains("Неважно.") {
            localPlayerName = "Рыцарь Света"
        } else {
            localPlayerName = playerName
        }
        let monsterNames = ["1. Ужасный-преужасный Огр", "2. Cтрашненький Скелет", " 3. Дикий саблезубый Котёнок", "4. Выбери за меня"]
        let monsterTypes = [Ogre(), Skeleton(), SabreToothedKitten()]
        
        switch monsterType {
        case monsterNames[0]:
             return Game(player: Player(name: localPlayerName), monster: Ogre())
        case monsterNames[1]:
            return Game(player: Player(name: localPlayerName), monster: Skeleton())
        case monsterNames[2]:
            return Game(player: Player(name: localPlayerName), monster: SabreToothedKitten())
        case monsterNames[3]:
            return Game(player: Player(name: localPlayerName), monster: monsterTypes.randomElement() ?? Ogre())
        default:
            return Game(player: Player(name: localPlayerName), monster: monsterTypes.randomElement() ?? Ogre())
        }
    }
    
    
}
