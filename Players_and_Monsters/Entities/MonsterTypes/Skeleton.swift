//
//  Skeleton.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation

class Skeleton: Monster {
    convenience init() {
        self.init(name: "Skeleton", attack: 10, defense: 10, maxHealth: 50, damage: 5)
    }
}

