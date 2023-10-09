//
//  GameStorage.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 09.10.2023.
//

import Foundation

enum GetGameData {
        
        struct Request {}
        
        struct GameInitRequest {
//            var playerName: String?
//            var monsterType: String?
        }
        
        struct Response {
            var gameService: GameService?
        }
        
        struct ViewModel {
            var gameService: GameService?
        }
    
}
