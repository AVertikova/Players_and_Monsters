//
//  main.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

var player: Creature = Player()
var monster: Creature = Ogre()

var game = Game(player: player as! Player, monster: monster as! Monster)

print("===================================================")
game.makeAttack(attacker: player, defender: &monster)
print("===================================================")
game.makeAttack(attacker: monster, defender: &player)
print("===================================================")
game.makeAttack(attacker: player, defender: &monster)
print("===================================================")
game.makeAttack(attacker: monster, defender: &player)
print("===================================================")
game.makeAttack(attacker: player, defender: &monster)
print("===================================================")
game.makeAttack(attacker: monster, defender: &player)
print("===================================================")
game.makeAttack(attacker: player, defender: &monster)
print("===================================================")
game.makeAttack(attacker: monster, defender: &player)

// TODO: make attacker switch via toggling bool
// TODO: monster heals himself if currentHealth < N

