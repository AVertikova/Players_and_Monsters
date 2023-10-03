//
//  Skeleton.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

class Skeleton: Monster {
    convenience override init() {
        self.init(name: "Scary Skeleton", maxHealth: 50, attackPower: 10, defensePower: 10, damagePower: 5)
    }
}
