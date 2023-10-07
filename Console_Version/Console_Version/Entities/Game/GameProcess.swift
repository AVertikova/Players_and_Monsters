//
//  GameProcess.swift
//
//
//  Created by Анна Вертикова on 03.10.2023.
//

import Foundation

class GameProcess {
    private let gameFactory =  GameFactory()
    
    
    func getCharacters() -> (playerName: String, monsterType: String) {
        var characters = (playerName: "", monsterType: "")
        
        
        print("Привет, Искатель Приключений! Как тебя зовут?")
        if let playerName = readLine() {
            characters.playerName = playerName
        }
        print("Привет, \(characters.playerName), Рыцарь Света! С каким чудищем сразимся сегодня?\nВведи только номер, пожалуйста. ")
        
        print("""
        1. Ужасный-преужасный Огр
        2. Страшненький Скелет
        3. Дикий саблезубый Котёнок
        4. Выбери за меня
        """)
        characters.monsterType = readLine()!
        
        return characters
    }
    
    func start() {
        let characters = getCharacters()
        let game = gameFactory.createNewGame(playerName: characters.playerName, monsterType: characters.monsterType)
        game.start()
        if game.isOver {
            print("\nИгра окончена! Хочешь сыграть ещё раз?\nY - Да\nЛюбая клавиша - Нет\n")
            let answer = readLine()
            if answer != "Y" || ((answer?.isEmpty) != nil){
                print("\nПриходи ещё!")
            } else {
                start()
            }
        }
    }
}
