//
//  SabreTotthedKitten.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

class SabreToothedKitten: Monster {
    convenience override init() {
        self.init(name: "Wild Sabre-Toothed Kitten", maxHealth: 30, attackPower: 15, defensePower: 30, damagePower: 10)
    }
}
