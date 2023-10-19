//
//  Ogre.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

class Ogre: Monster {
    convenience init() {
        self.init(name: "Огр", maxHealth: 150, attackPower: 30, defensePower: 10, damagePower: 20)
    }
}
