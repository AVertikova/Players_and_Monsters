//
//  Game.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

class Game {
    var player: Player?
    var monster: Monster?
    
    init(player: Player, monster: Monster) {
        self.player = player
        self.monster = monster
    }
    
    func getAttackModifier(attacker: Creature, defender: Creature) -> UInt8 {
        return attacker.attackPower > defender.defensePower  ? (attacker.attackPower - defender.defensePower + 1) : 1
        
    }
    
    func makeAttack(attacker: Creature, defender: inout Creature) {
        print("\(attacker.name) бьёт \(defender.name) c силой \(attacker.attackPower)!")
        print("\(defender.name) защищается c силой \(defender.defensePower)!")
        let cubesCount = getAttackModifier(attacker: attacker, defender: defender)
        print("Attack modifier: \(cubesCount)")
        if (throwCubes(attackModifier: cubesCount)) {
            print("Успешная атака!")
            let damage = UInt8.random(in: 1...attacker.damagePower)
            defender.currentHealth -= UInt(damage)
            print("\(defender.name) получает \(damage) урона")
            print("Здоровье \(defender.name) - \(defender.currentHealth)")
            print("Здоровье \(attacker.name) - \(attacker.currentHealth)")
            
            if let defender = defender as? Monster {
                if (defender.currentHealth <= defender.maxHealth/2) {
                    defender.heal()
                    print("\(defender.name) принимает исцеляющую микстуру.")
                    print("Здоровье \(defender.name) - \(defender.currentHealth)")
                }
            }
            
        } else {
            print("Атака отражена!")
        }
        
        
    }
    
    func throwCubes(attackModifier: UInt8) -> Bool {
        var cubes: [UInt8] = []
        for _ in 1...attackModifier {
            let cube = UInt8.random(in: 1...6)
            cubes.append(cube)
        }
        return  (cubes.contains(5) || cubes.contains(6))
    }
    
    func makeDamage(attacker: Creature, defender: Creature) {
        
    }
}
