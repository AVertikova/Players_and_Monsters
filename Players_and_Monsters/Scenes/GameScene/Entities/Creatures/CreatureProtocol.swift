//
//  CreatureProtocol.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

protocol CreaturePropertiesProtocol: Codable {
    var name: String {get set}
    var maxHealth: UInt {get set} // 0-N
    var currentHealth: UInt {get set}
    var attackPower: UInt {get set} // 0-30
    var defensePower: UInt  {get set} // 0-30
    var damagePower: UInt {get set} // M-N ex 1-6
    var healPills: UInt {get set} // 4
    var healPower: UInt {get}
    var isAlive: Bool {get}
}

protocol MonsterHealingProtocol {
    func healMonster()
}

protocol PlayerHealingProtocol {
    func healPlayer()
}
