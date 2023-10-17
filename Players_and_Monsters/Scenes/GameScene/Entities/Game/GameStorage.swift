//
//  GameStorage.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 09.10.2023.
//

import Foundation

//typealias AttackInfo = (playerAttacks: Bool,
//attackPower: Bool,
//defensePower: UInt,
//attackModifier: UInt)

//typealias AttackResult = (playerAttacks: Bool,
//  attackSuccess: Bool,
//  damage: UInt,
//  gameOver: Bool)

enum GetGameData {
    
    struct Request {}
    
    struct GameInitRequest {}
    
    struct AttackRequest {
        var playerAttacks: Bool
    }
    
    struct Response {
        var gameService: GameService?
    }
    
    struct ViewModel {
        var gameService: GameService?
    }
    
}
