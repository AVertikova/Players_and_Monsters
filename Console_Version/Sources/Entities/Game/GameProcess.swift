//
//  File.swift
//  
//
//  Created by Анна Вертикова on 03.10.2023.
//

import Foundation

protocol GameProcessProtocol {
    func getCharacters() -> (playerName: String, monsterType: String)
    func start()
}

class GameProcess: GameProcessProtocol {
    private let gameFactory =  GameFactory()
   
    
    func getCharacters() -> (playerName: String, monsterType: String) {
        var characters = (playerName: "", monsterType: "")
       

        print("***Hello***, Adventurer! What is your name?")
        characters.playerName = readLine()!
        print("Hello, \(characters.playerName), the Knight of Light! What monster would you like to defeat? Type a number, please")
        print("""
        1. Dreadful Ogre
        2. Scary Skeleton
        3. Wild Sabre-toothed Kitten
        4. Choose for me
        """)
        characters.monsterType = readLine()!
        
        return characters
    }
    
    func start() {
        let characters = getCharacters()
        let game = gameFactory.createNewGame(playerName: characters.playerName, monsterType: characters.monsterType)
        game.start()
        if game.isOver {
            print("Игра окончена! Хочешь сыграть ещё раз? y - Да, любая клавиша - Нет")
            if readLine() == "y" {
                start()
            } else {
                print("Приходи ещё!")
            }
        }

        
    }
    
    
}
