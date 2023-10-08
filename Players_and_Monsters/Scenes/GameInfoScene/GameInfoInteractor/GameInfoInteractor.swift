//
//  GameInfoInteractor.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import Foundation

class GameInfoInteractor: GameInfoInteractorPropertiesProtocol {
    weak var presenter: GameInfoInteractorToPresenterResponseProtocol?
    
    
    
}

extension GameInfoInteractor: GameInfoPresenterToInteractorRequestProtocol {
    func fetchData() {
        print("GameInfoInteractor: Got Request from Presenter to fetch data. Will give presenter the required data.")
        presenter?.fetchDataSuccess()
    }
    
    
}
