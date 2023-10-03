//
//  Game.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

class Game {
    var player: Creature
    var monster: Creature
    var isOver: Bool = false
    
    init(player: Creature, monster: Creature) {
        self.player = player
        self.monster = monster
    }
    
    
    
    func getAttackModifier(attacker: Creature, defender: Creature) -> UInt8 {
        return attacker.attackPower > defender.defensePower  ? (attacker.attackPower - defender.defensePower + 1) : 1
        
    }
    
    func makeAttack(attacker: Creature, defender: inout Creature) {
        if attacker is Player {
            print()
            print("Твой ход, \(attacker.name)! Готов бить? Нажми любую клавишу, если да. ")
            if readLine() != nil {
                print("Бьём!")
            }
        } else if attacker is Monster {
            print()
            print()
            print("Теперь бьёт твой противник! Приготовься!\n")
            sleep(2)
            
        }
        
        print("\(attacker.name) бьёт \(defender.name) c силой \(attacker.attackPower)!")
        print("\(defender.name) защищается c силой \(defender.defensePower)!")
        let cubesCount = getAttackModifier(attacker: attacker, defender: defender)
        print("Модификатор атаки: \(cubesCount)")
        if (throwCubes(attackModifier: cubesCount)) {
            print("Успешная атака!")
            let damage = UInt8.random(in: 1...attacker.damagePower)
            if defender.currentHealth >= UInt(damage) {
                defender.currentHealth -= UInt(damage)
            } else {
                defender.currentHealth = 0
            }
            print("\(defender.name) получает \(damage) урона")
            print("Здоровье \(defender.name) - \(defender.currentHealth)")
            print("Здоровье \(attacker.name) - \(attacker.currentHealth)")
            
            if let defender = defender as? Monster {
                if (defender.currentHealth <= defender.maxHealth/2 && defender.healPills > 0) {
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
    
    func start() {
        print("""
        So, \(player.name), your parameters are:
        health is \(player.currentHealth),
        attack power is \(player.attackPower),
        defense power is \(player.defensePower),
        damage power is \(player.damagePower).
        Also, you have 4 magic healing mixtures
        
        Your Enemy is \(monster.name), his parameters are:
        health is \(monster.currentHealth),
        attack power is \(monster.attackPower),
        defense power is \(monster.defensePower),
        damage power is \(monster.damagePower).
        Also, he has 4 magic healing mixtures
        """)
        
        repeat {
            makeAttack(attacker: player, defender: &monster)
            if monster.isAlive {
                makeAttack(attacker: monster, defender: &player)
                if player.currentHealth < player.maxHealth/2 {
                    proposeToHeal()
                }
            }
        } while player.isAlive && monster.isAlive
        isOver = true
        
        if player.isAlive {
            print("ТЫ ПОБЕДИЛ!!!")
        } else {
            print("ТЫ ПОГИБ :((")
        }
        
        
    }
    
    
    func proposeToHeal() {
        print("\(player.name), твоё здоровье \(player.currentHealth). Дать исцеляющую микстуру? y - да, n -  нет. ")
        if case readLine() = "y" {
            player.heal()
            //            TODO: make switch player.health and player.healPills and/or repeat while
            if player.currentHealth == player.maxHealth {
                print("\(player.name), твоё здоровье восстановилось полностью.")
                if player.healPills > 0 {
                    print("Осталось микстур: \(player.healPills)")
                } else {
                    print("Будь осторожнее! Исцеляющих микстур не осталось.")
                }
            }
            if player.currentHealth < player.maxHealth && player.healPills > 0 {
                print("\(player.name), твоё здоровье \(player.currentHealth). Осталось микстур: \(player.healPills). Дать исцеляющую микстуру? y - да, n -  нет. ")
                if case readLine() = "y" {
                    player.heal()
                } else {
                    print("Держись!")
                }
            }
        }
    }
}
