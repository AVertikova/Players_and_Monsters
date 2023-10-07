//
//  GameInteractor.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation

class GameInteractor: GameInteractorPropertiesProtocol {
   weak var presenter: GameInteractorToPresenterProtocol?
}

extension GameInteractor: GamePresenterToInteractorProtocol {
    func fetchData() {
        presenter?.fetchDataSuccess()
    }
    
}
