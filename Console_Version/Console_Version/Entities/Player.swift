//
//  Player.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

final class Player: Creature {
    var name: String
    var maxHealth: UInt
    var currentHealth: UInt
    var attackPower: UInt8
    var defensePower: UInt8
    var damagePower: UInt8
    var healPills: UInt8
    var isAlive: Bool {
        get {return currentHealth > 0}
    }
    
    init() {
        self.name = "Player"
        self.maxHealth = 100
        self.currentHealth = maxHealth
        self.attackPower = 20
        self.defensePower = 20
        self.damagePower = 12
        self.healPills = 4
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
    func heal() {
        if isAlive && self.healPills > 0 {
            currentHealth += UInt(Double(maxHealth)/100*30)
            if currentHealth > maxHealth {
                currentHealth = maxHealth
            }
            self.healPills -= 1
        }
    }
}
