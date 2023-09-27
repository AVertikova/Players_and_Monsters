//
//  Player.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation

class Player: Creature {
    var name: String
    var attack: UInt8
    var defense: UInt8
    var maxHealth: UInt
    var currentHealth: UInt
    var damage: UInt8
    var healPills: UInt8 = 4
    
    init(name: String, attack: UInt8, defense: UInt8, maxHealth: UInt, damage: UInt8) {
        self.name = name
        self.attack = attack
        self.defense = defense
        self.maxHealth = maxHealth
        self.currentHealth = maxHealth
        self.damage = damage
        self.healPills = 4
    }
    
    func heal() {
        currentHealth += currentHealth/100*30
        if currentHealth > maxHealth {
            currentHealth = maxHealth
        }
    }
}
