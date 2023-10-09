//
//  GameInfoStorage.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 09.10.2023.
//

import Foundation



enum GetCharactersData {
    struct Request {}
    
    struct Response {
        var playerData: String = """
            Игрок: \(UserDefaults.standard.string(forKey: "playerName") ?? "")
            
            Здоровье: 100
            Сила атаки: 20
            Сила защиты: 20
            Урон: 12
            Исцеляющие микстуры: 4
"""
        
        var ogreData: String = """
            Противник: Огр. 
            Ужасный-преужасный. Хромает слегка.

            Здоровье: 100
            Сила атаки: 30
            Сила защиты: 10
            Урон: 20
            Исцеляющие микстуры: 4
            (Использует по своему 
            огрскому усмотрению)
"""
        
        var skeletonData: String = """
            Противник: Скелет. 
            Страшненький, но почти безобидный.

            Здоровье: 50
            Сила атаки: 10
            Сила защиты: 10
            Урон: 5
            Исцеляющие микстуры: 4
            (Использует по своему
            скелеторскому усмотрению)
"""
        var kittenData: String = """
            Противник: Котёнок. 
            Милый, но саблезубый.
            Порой выматывает.

            Здоровье: 30
            Сила атаки: 15
            Сила защиты: 30
            Урон: 10
            Исцеляющие микстуры: 4
            (Использует по своему
            кошачьему усмотрению)
"""
    }
    
    
    struct ViewModel {
        var playerData: String?
        var monsterData:String?
        
    }
}
