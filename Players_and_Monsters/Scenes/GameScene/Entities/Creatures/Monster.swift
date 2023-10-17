//
//  Monster.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

class Monster: CreaturePropertiesProtocol {
    
    
    var name: String
    var maxHealth: UInt
    var currentHealth: UInt
    var attackPower: UInt
    var defensePower: UInt
    var damagePower: UInt
    var healPills: UInt
    lazy var healPower: UInt = {
        UInt(Double(maxHealth * 30 / 100))
    }()
    var isAlive: Bool {
        get {return currentHealth > 0}
    }
    
    init(name: String, maxHealth: UInt, attackPower: UInt,  defensePower: UInt, damagePower: UInt) {
        self.name = name
        self.maxHealth = maxHealth
        self.currentHealth = maxHealth
        if attackPower <= 30 {
            self.attackPower = attackPower
        } else {
            self.attackPower = UInt.random(in: 1...30)
        }
        if defensePower <= 30 {
            self.defensePower = defensePower
        } else {
            self.defensePower = UInt.random(in: 1...30)
        }
        if damagePower >= 1 && damagePower <= 6 {
            self.damagePower = damagePower
        } else {
            self.damagePower = UInt.random(in: 1...6)
        }
        
        self.healPills = 4
    }
    
}

extension Monster: MonsterHealingProtocol {
    func healMonster() {
        if isAlive && self.healPills > 0 {
            currentHealth += healPower
            if currentHealth > maxHealth {
                currentHealth = maxHealth
            }
            self.healPills -= 1
        }
            
        
    }
}
