//
//  GamePresenter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation
// ref to interactor, router, view

protocol PresentationLogic {
    var view: DisplayLogic? {get set}
    var interactor: InteractionLogic? {get set}
    var router: RoutingLogic? {get set}
    
    func interactorDidFetchMonsters(with result: Result<[Monster], Error>)
    
}

class GamePresenter: PresentationLogic {
    var view: DisplayLogic?
    var interactor: InteractionLogic?
    var router: RoutingLogic?
    
    func interactorDidFetchMonsters(with result: Result<[Monster], Error>) {
        
    }
    
    
}
