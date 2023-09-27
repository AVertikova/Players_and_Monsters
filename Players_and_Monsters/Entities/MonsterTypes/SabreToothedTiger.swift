//
//  SabreToothedTiger.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation

class SabreToothedTiger: Monster {
    convenience init() {
        self.init(name: "SabreToothedTiger", attack: 15, defense: 10, maxHealth: 80, damage: 15)
    }
}
