//
//  Monsters.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation

class Monster: Creature {
    var attack: UInt8
    var defense: UInt8
    var maxHealth: UInt
    var currentHealth: UInt
    var damage: UInt8
    var healPills: UInt8 = 4
}
