//
//  Game.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation

import Foundation

class Game {
    var player: Creature
    var monster: Creature
    var isOver: Bool = false
    var attackModifier: UInt8 = 0
    
    init(player: Creature, monster: Creature) {
        self.player = player
        self.monster = monster
    }
}


extension Game {
    
    func makeAttack(attacker: Creature, defender: inout Creature) -> Bool {
        
        self.attackModifier = getAttackModifier(attacker: attacker, defender: defender)
        if (throwCubes(cubesCount: attackModifier)) {
            let damage = UInt8.random(in: 1...attacker.damagePower)
            if defender.currentHealth > UInt(damage) {
                defender.currentHealth -= UInt(damage)
            } else {
                defender.currentHealth = 0
                isOver = true
            }

            if defender is Monster {
                if (defender.currentHealth <= defender.maxHealth/2 && defender.healPills > 0) {
                    defender.heal()
                }
            }
          return true
        } else {
           return false
        }
    }
    
    
    
}

