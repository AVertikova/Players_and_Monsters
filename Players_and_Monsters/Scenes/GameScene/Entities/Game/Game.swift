//
//  Game.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//



import Foundation

typealias PlayerProtocol = CreaturePropertiesProtocol&PlayerHealingProtocol
typealias MonsterProtocol = CreaturePropertiesProtocol&MonsterHealingProtocol

class Game {
   private var player: PlayerProtocol
   private var monster: MonsterProtocol
   private var isOver: Bool = false
   private var attackModifier: UInt = 0
    
    
    init(player: PlayerProtocol, monster: MonsterProtocol) {
        self.player = player
        self.monster = monster
    }
}


extension Game {
    
    func attack(attackRequest: GetGameData.AttackRequest) -> (attackInfo: AttackInfo, AttackResult: AttackResult) {
        
        if attackRequest.playerAttacks == true {
            let attack =  playerAttacking()
          let attackInfo = (attacker: player.name,
                          defender: monster.name,
                          attackPower: player.attackPower,
                          defensePower: monster.defensePower,
                          attackModifier: attackModifier)
          let attackResult = (attackSuccess: attack.success,
                            damage: attack.damage,
                            defenderHealth: monster.currentHealth,
                            gameOver: self.isOver,
                            monsterHealed: attack.monsterHealed)
            return (attackInfo, attackResult)
            
        } else {
            let attack = monsterAttacking()
            let attackInfo = (attacker: monster.name,
                          defender: player.name,
                          attackPower: monster.attackPower,
                          defensePower: player.defensePower,
                          attackModifier: attackModifier)
            let attackResult = (attackSuccess: attack.success,
                            damage: attack.damage,
                            defenderHealth: player.currentHealth,
                            gameOver: self.isOver,
                            monsterHealed: false)
            
            return (attackInfo, attackResult)
        }
        
        
    }
    
    func playerAttacking() -> (success: Bool, damage: UInt, monsterHealed: Bool) {
        var defender = self.monster
        var damage: UInt = 0
        var monsterHealed: Bool = false
        self.attackModifier = getAttackModifier(attacker: self.player, defender: defender)
        if (throwCubes(cubesCount: self.attackModifier)) {
            damage = UInt.random(in: 1...self.player.damagePower)
            if defender.currentHealth > damage {
                defender.currentHealth -= damage
                if (defender.currentHealth <= defender.maxHealth/2 && defender.healPills > 0) {
                    defender.healMonster()
                    monsterHealed = true
                }
            } else {
                defender.currentHealth = 0
                isOver = true
            }
            return (true, damage, monsterHealed )
            
        } else {
            return (false, damage, monsterHealed)
        }
    }
    
    func monsterAttacking() -> (success: Bool, damage: UInt) {
        var defender = self.player
        var damage: UInt = 0
        self.attackModifier = getAttackModifier(attacker: self.monster, defender: defender)
        if (throwCubes(cubesCount: self.attackModifier)) {
            damage = UInt.random(in: 1...self.monster.damagePower)
            if defender.currentHealth > damage {
                defender.currentHealth -= damage
            } else {
                defender.currentHealth = 0
                isOver = true
            }
            return (true, damage)
        } else {
            return (false, damage)
        }
    }
    
    func healPlayer() -> (healSuccess: Bool, currentHealth: UInt, healPills: UInt) {
       return self.player.healPlayer()
    }
}

