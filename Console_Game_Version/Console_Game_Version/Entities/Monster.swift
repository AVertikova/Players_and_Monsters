//
//  Monster.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

class Monster: Creature {
    var name: String
    var maxHealth: UInt
    var currentHealth: UInt
    var attackPower: UInt8
    var defensePower: UInt8
    var damagePower: UInt8
    var healPills: UInt8
    
    init(name: String, maxHealth: UInt, attackPower: UInt8,  defensePower: UInt8, damagePower: UInt8) {
        self.name = name
        self.maxHealth = maxHealth
        self.currentHealth = maxHealth
        self.attackPower = attackPower
        self.defensePower = defensePower
        self.damagePower = damagePower
        self.healPills = 4
    }
    
    func heal() {
        currentHealth += maxHealth/100*30
        if currentHealth > maxHealth {
            currentHealth = maxHealth
        }
        if self.healPills > 0 {
            self.healPills -= 1
        }
    }
}
