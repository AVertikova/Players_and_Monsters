//
//  GamePresenter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation
import UIKit


class GamePresenter: GamePresenterPropertiesProtocol {
    
    weak var viewController: GamePresenterToViewResponseProtocol?
    var interactor: GamePresenterToInteractorRequestProtocol?
    var router: GamePresenterToRouterRequestProtocol?
    
    
}

extension GamePresenter: GameViewToPresenterRequestProtocol {
    func healButtonTapped() {
        interactor?.healButtonTapped()
    }
    
    
    func attackButtonTapped(playerAttacks: Bool) {
        interactor?.attackButtonTapped(playerAttacks: playerAttacks)
    }
    
    func fetchGame(request: GetGameData.GameInitRequest) {
        interactor?.initGame(request: request)
    }
    
    
    
}

extension GamePresenter: GameInteractorToPresenterResponseProtocol {
    func fetchGameOver(winner: String) {
        let dataToDisplay: String = """

    ==========ИГРА ОКОНЧЕНА!===========
            Победил \(winner).
    

"""
        viewController?.showGameOver(dataToDisplay: dataToDisplay)
    }
    

    
    func fetchHealSuccess(response: GetGameData.Response) {
        var currentHealth: String = ""
        var healPillsRemain: String = ""
        
        if let health = response.gameService?.getPlayerData().health {
            currentHealth =  "\(health)"
        }
        
        if let pills = response.gameService?.getPlayerData().healPills {
            healPillsRemain = "\(pills)"
        }
        
        let dataToDisplay: String = """

    Так-то лучше!
    Здоровье: \(currentHealth).
    Осталось микстур: \(healPillsRemain).

"""
        viewController?.showView(dataToDisplay: dataToDisplay)
    }
    
    func fetchHealFail(response: GetGameData.Response) {
        let dataToDisplay: String = "\n\nОй, у тебя нет исцеляющих микстур!\nНо ты держись там!\n\n"
        viewController?.showNoHealPillsView(dataToDisplay: dataToDisplay)
    }
    
    
    func fetchAttackDetails(response: GetGameData.Response, attacker: String) {
        var attackerName: String = ""
        var defenderName: String = ""
        var attackPower: String = ""
        var defensePower: String = ""
        var attackModifier: String = ""
        
        
        if attacker == "Player" {
            if let aName = response.gameService?.getPlayerData().name {
                attackerName =  "\(aName)"
            }
            if let dName = response.gameService?.getMonsterData().name {
                defenderName =  "\(dName)"
            }
            if let attack = response.gameService?.getPlayerData().attackPower {
                attackPower =  "\(attack)"
            }
            if let defense = response.gameService?.getMonsterData().defensePower {
                defensePower =  "\(defense)"
            }
            if let modifier = response.gameService?.getAttackModifier() {
                attackModifier = "\(modifier)"
            }
        } else {
            if let aName = response.gameService?.getMonsterData().name {
                attackerName =  "\(aName)"
            }
            if let dName = response.gameService?.getPlayerData().name {
                defenderName =  "\(dName)"
            }
            if let attack = response.gameService?.getMonsterData().attackPower {
                attackPower =  "\(attack)"
            }
            if let defense = response.gameService?.getPlayerData().defensePower {
                defensePower =  "\(defense)"
            }
            if let modifier = response.gameService?.getAttackModifier() {
                attackModifier = "\(modifier)"
            }
        }
        
        let dataToDisplay: String = """

    \(attackerName) атакует с силой \(attackPower)!
    \(defenderName) защищается с силой \(defensePower).
    Модификатор атаки: \(attackModifier).

"""
        viewController?.showView(dataToDisplay: dataToDisplay)
    }
    
    func fetchAttackSucces(response: GetGameData.Response, attacker: String, damage: UInt) {
        var attackerName: String = ""
        var defenderName: String = ""
        let damageMade: String = "\(damage)"
        var defenderHealth: String = ""
        var dataToDisplay: String = ""
        
        if damage == 999 {
            if attacker == "Player" {
                if let aName = response.gameService?.getPlayerData().name {
                    attackerName =  "\(aName)"
                }
                dataToDisplay = "ИГРА ОКОНЧЕНА! Победил \(attackerName) "
            } else {
                if let aName = response.gameService?.getMonsterData().name {
                    attackerName =  "\(aName)"
                }
            }
            dataToDisplay = "ИГРА ОКОНЧЕНА! Победил \(attackerName) "
        } else {
            
            if attacker == "Player" {
                if let dName = response.gameService?.getMonsterData().name {
                    defenderName =  "\(dName)"
                }
                if let health = response.gameService?.getMonsterData().health {
                    defenderHealth = "\(health)"
                }
                
                
            } else {
                if let dName = response.gameService?.getPlayerData().name {
                    defenderName =  "\(dName)"
                }
                if let health = response.gameService?.getPlayerData().health {
                    defenderHealth = "\(health)"
                }
                
            }
            if damage == 777 {
                dataToDisplay = """
       
        Успешная атака!
        Но \(defenderName) успел подлечиться.
        Здоровье \(defenderName): \(defenderHealth).
    
    """
                
            } else {
                dataToDisplay = """
       
        Успешная атака!
        \(defenderName) получает \(damageMade) урона.
        Здоровье \(defenderName): \(defenderHealth).
    
    """
            }
            viewController?.showView(dataToDisplay: dataToDisplay)
        }
    }

    
    func fetchAttackFail() {
        let dataToDisplay: String = """
    
    Атака провалена!

"""
        viewController?.showView(dataToDisplay: dataToDisplay)
    }
    
    func fetchData(response: GetGameData.Response) {
    }
    
    
}
