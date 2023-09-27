//
//  GameRouter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation

// entry point

protocol RoutingLogic {
    static func start() -> RoutingLogic
}

class GameRouter: RoutingLogic {
    static func start() -> RoutingLogic {
        let router = GameRouter()
        
        // Assign VIP
        
        return router
    }
    
    
}
