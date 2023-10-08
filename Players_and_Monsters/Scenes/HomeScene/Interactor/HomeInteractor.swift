//
//  HomeInteractor.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation



class HomeInteractor: HomeInteractorPropertiesProtocol {
   weak var presenter: HomeInteractorToPresenterResponseProtocol?
    var gameService: GameService?
}

extension HomeInteractor: HomePresenterToInteractorRequestProtocol {
    func createGame(playerName: String, monsterType: String) {
        <#code#>
    }
    
    func fetchData() {
        print("HomeInteractor: Got Request from Presenter to fetch data. Will give presenter the required data.")
        let monsterTypes = ["1. Ужасный-преужасный Огр", "2. Cтрашненький Скелет", " 3. Дикий саблезубый Котёнок", "4. Выбери за меня" ]
        presenter?.fetchDataSuccess(monsterTypes: monsterTypes)

    }
}
