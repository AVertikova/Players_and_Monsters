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
    func fetchCharactersData(request: GetCharactersData.Request) {
        let response = GetCharactersData.Response()
        presenter?.fetchGameData(response: response)
    }
    
    
}
