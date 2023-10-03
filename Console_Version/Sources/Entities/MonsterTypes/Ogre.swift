//
//  Ogre.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

class Ogre: Monster {
    convenience override init() {
        self.init(name: "Dreadful Ogre", maxHealth: 100, attackPower: 30, defensePower: 10, damagePower: 20)
    }
}
