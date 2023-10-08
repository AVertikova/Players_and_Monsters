//
//  SabreTotthedKitten.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

class SabreToothedKitten: Monster {
    convenience init() {
        self.init(name: "Саблезубый Котёнок", maxHealth: 30, attackPower: 15, defensePower: 30, damagePower: 10)
    }
}

