//
//  CreatureProtocol.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation


protocol Creature: Codable {
    var name: String {get set}
    var attack: UInt8 {get set} // 0-30
    var defense: UInt8 {get set} // 0-30
    var maxHealth: UInt {get set} // 0-N
    var currentHealth: UInt {get set}
    var damage: UInt8 {get set} // M-N ex 1-6
    var healPills: UInt8 {get set} // 4
    
    func heal()
}
