//
//  Game+.swift
//
//
//  Created by Анна Вертикова on 04.10.2023.
//

import Foundation

extension Game {
    func getAttackModifier(attacker: Creature, defender: Creature) -> UInt8 {
        return attacker.attackPower > defender.defensePower  ? 
        (attacker.attackPower - defender.defensePower + 1) : 1
        
    }
    
    func throwCubes(attackModifier: UInt8) -> Bool {
        var cubes: [UInt8] = []
        for _ in 1...attackModifier {
            let cube = UInt8.random(in: 1...6)
            cubes.append(cube)
        }
        return  (cubes.contains(5) || cubes.contains(6))
    }
}

