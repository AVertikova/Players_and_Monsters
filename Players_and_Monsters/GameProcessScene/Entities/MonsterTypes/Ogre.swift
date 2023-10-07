//
//  Ogre.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation

class Ogre: Monster {
    convenience init() {
        self.init(name: "Ogre", attack: 30, defense: 30, maxHealth: 100, damage: 20)
    }
}


