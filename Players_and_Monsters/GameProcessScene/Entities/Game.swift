//
//  Game.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation

class Game {
    var player: Player?
    var monster: Monster?
    
    
    
    func getAttackModifier(attacker: Creature, defender: Creature) -> UInt8 {
        return attacker.attack - defender.defense + 1
    }
    
    func makeAttack(attacker: Creature, defender: Creature)  {
        var cubesCount = getAttackModifier(attacker: attacker, defender: defender)
        
    }
    
    func attack(attacker: Creature, defender: Creature, with result: Result<[Monster], Error>) {
        
    }
}
