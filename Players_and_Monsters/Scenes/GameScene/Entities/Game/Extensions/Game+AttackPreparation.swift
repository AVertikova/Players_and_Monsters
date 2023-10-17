//
//  Game+AttackPreparation.swift
//
//
//  Created by Анна Вертикова on 04.10.2023.
//

import Foundation

extension Game {
    func getAttackModifier(attacker: CreaturePropertiesProtocol, defender: CreaturePropertiesProtocol) -> UInt {
        return attacker.attackPower > defender.defensePower  ?
        (attacker.attackPower - defender.defensePower + 1) : 1
        
    }
    
    func throwCubes(cubesCount: UInt) -> Bool {
        var cubes: [UInt] = []
        for _ in 1...cubesCount {
            let cube = UInt.random(in: 1...6)
            cubes.append(cube)
        }
        return  (cubes.contains(5) || cubes.contains(6))
    }
}

