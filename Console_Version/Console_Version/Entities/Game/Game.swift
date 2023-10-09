//
//  Game.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

class Game {
    private var player: Creature
    private var monster: Creature
    var isOver: Bool = false
    var dontAskAgain:Bool = false
    var firstHeal:Bool = true
    
    init(player: Creature, monster: Creature) {
        self.player = player
        self.monster = monster
    }
}


extension Game {
    
    func start() {
        print("""
        
        Итак, \(player.name):
        Здоровье: \(player.currentHealth)
        Сила атаки: \(player.attackPower)
        Сила защиты: \(player.defensePower)
        Урон: \(player.damagePower)
        Исцеляющие микстуры: 4
        
        Твой враг - \(monster.name):
        Здоровье: \(monster.currentHealth)
        Сила атаки: \(monster.attackPower)
        Сила защиты: \(monster.defensePower)
        Урон: \(monster.damagePower)
        Исцеляющие микстуры: 4
        
        """)
        fight()
    }
    
    func fight() {
        repeat {
            makeAttack(attacker: player, defender: &monster)
            if monster.isAlive {
                makeAttack(attacker: monster, defender: &player)
                if player.currentHealth < player.maxHealth/2
                    && player.isAlive {
                    proposeToHeal()
                }
            }
        } while player.isAlive && monster.isAlive
        isOver = true
        
        if player.isAlive {
            
            print("\nТЫ ПОБЕДИЛ!!!\n")
        } else {
            print("\nТЫ ПОГИБ :((\n")
        }
        
    }
    
    func makeAttack(attacker: Creature, defender: inout Creature) {
        if attacker is Player {
            print("\nТвой ход, \(attacker.name)! Готов бить? Нажми любую клавишу, если да.\n")
            if readLine() != nil {
                print("Бьём!")
            }
        } else if attacker is Monster {
            print("Теперь бьёт твой противник! Приготовься!")
            sleep(1)
          
            
            
        }
        
        print("\n\(attacker.name) бьёт \(defender.name) c силой \(attacker.attackPower)!")
        print("\(defender.name) защищается c силой \(defender.defensePower)!")
        let cubesCount = getAttackModifier(attacker: attacker, defender: defender)
        print("Модификатор атаки: \(cubesCount)")
        if (throwCubes(attackModifier: cubesCount)) {
            print("\nУспешная атака!\n")
            let damage = UInt8.random(in: 1...attacker.damagePower)
            if defender.currentHealth >= UInt(damage) {
                defender.currentHealth -= UInt(damage)
            } else {
                defender.currentHealth = 0
            }
            print("\(defender.name) получает \(damage) урона")
            print("Здоровье \(defender.name): \(defender.currentHealth)")
            print("Здоровье \(attacker.name): \(attacker.currentHealth)")

            if defender is Monster {
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
    
    
    func proposeToHeal() {
        var answer = ""
        
       
        if dontAskAgain == false {
            if firstHeal == true {
                print("\nЗДОРОВЬЕ: \(player.currentHealth)!\nДать исцеляющую микстуру?\n Y - Да\n Любая клавиша - Нет\n A - Больше не спрашивать\n")
                answer = readLine() ?? ""
            } else {
                answer = "Y"
            }
            if answer == "Y" {
                player.heal()
                
                if player.healPills > 0 {
                    print("Осталось микстур: \(player.healPills)")
                    print("Здоровье: \(player.currentHealth)")
                    if player.currentHealth < player.maxHealth {
                        print("Повторить?\n Y - Да\n Любая клавиша - Нет\n A - Больше не спрашивать\n ")
                        let answer = readLine()
                        if answer == "Y" {
                            firstHeal = false
                            proposeToHeal()
                        } else  if answer == "A" {
                            dontAskAgain = true
                        } else {
                            firstHeal = true
                        }
                    } else if player.currentHealth == player.maxHealth {
                        print("\(player.name), твоё здоровье восстановилось полностью.")
                        firstHeal = true
                    }
                } else {
                    if dontAskAgain == false {
                        print("Будь осторожнее! Исцеляющих микстур не осталось.")
                        print("Здоровье: \(player.currentHealth)")
                        dontAskAgain = true
                    }
                }
                
            } else if answer == "A" {
                dontAskAgain = true
            } else {
                firstHeal = true
            }
        }
    }
}


