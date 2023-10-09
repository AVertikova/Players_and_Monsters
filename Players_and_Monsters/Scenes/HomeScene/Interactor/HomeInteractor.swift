//
//  HomeInteractor.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation



class HomeInteractor: HomeInteractorPropertiesProtocol {
    weak var presenter: HomeInteractorToPresenterResponseProtocol?
}

extension HomeInteractor: HomePresenterToInteractorRequestProtocol {
    func saveChoice(playerName: String, monsterType: String) {
        if playerName.isEmpty {
            let playerDefaultName = """
            Рыцарь Света. Или Оля?
                        Неважно. Главное, мы - за добро.
            """
            UserDefaults.standard.set(playerDefaultName, forKey: "playerName")
        } else {
            UserDefaults.standard.set(playerName, forKey: "playerName")
        }
        UserDefaults.standard.set(monsterType, forKey: "monsterType")
    }
    
    
    func fetchChoiceData(request: GetHomeData.Request) {
        let response = GetHomeData.Response()
        presenter?.fetchChoiceDataSuccess(response: response)
        
    }
}
