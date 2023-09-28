//
//  CreatureProtocol.swift
//  Console_Game_Version
//
//  Created by Анна Вертикова on 28.09.2023.
//

import Foundation

protocol Creature: Codable {
    var name: String {get set}
    var maxHealth: UInt {get set} // 0-N
    var currentHealth: UInt {get set}
    var attackPower: UInt8 {get set} // 0-30
    var defensePower: UInt8 {get set} // 0-30
    var damagePower: UInt8 {get set} // M-N ex 1-6
    var healPills: UInt8 {get set} // 4
    
    func heal()
}


