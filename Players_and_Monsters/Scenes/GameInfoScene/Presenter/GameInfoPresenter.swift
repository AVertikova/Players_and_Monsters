//
//  GameInfoPresenter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import Foundation
import UIKit

class GameInfoPresenter: GameInfoPresenterPropertiesProtocol {
    weak var viewController: GameInfoPresenterToViewResponseProtocol?
    var interactor: GameInfoPresenterToInteractorRequestProtocol?
    var router: GameInfoPresenterToRouterRequestProtocol?
    
    
}

extension GameInfoPresenter: GameInfoViewToPresenterRequestProtocol {
    
    func fetchCharactersData(request: GetCharactersData.Request) {
        interactor?.fetchCharactersData(request: request)
    }
    
    func startGameButtonTapped(navigationController: UINavigationController) {
        router?.pushToGameScene(navigationController: navigationController)
    }
    
    
}

extension GameInfoPresenter: GameInfoInteractorToPresenterResponseProtocol {
    
    func fetchGameData(response: GetCharactersData.Response) {
       let viewModel = createViewModel(response: response)
        if viewModel.playerData != nil {
            if viewModel.monsterData != nil{
                viewController?.showView(viewModel: viewModel)
            }
        } else {
            viewController?.showError()
        }
    }
    
    func createViewModel(response: GetCharactersData.Response) -> GetCharactersData.ViewModel {
        var monster = UserDefaults.standard.string(forKey: "monsterType") ?? "4. Выбери за меня"
        
        if monster == "4. Выбери за меня" {
            let monsters = ["1. Ужасный-преужасный Огр",
                            "2. Cтрашненький Скелет",
                            "3. Дикий саблезубый Котёнок"]
            monster = monsters.randomElement() ?? "2. Cтрашненький Скелет"
        }
        
        switch monster {
        case "1. Ужасный-преужасный Огр":
            return GetCharactersData.ViewModel(playerData: response.playerData, monsterData: response.ogreData)
        case "2. Cтрашненький Скелет":
            return GetCharactersData.ViewModel(playerData: response.playerData, monsterData: response.skeletonData)
        case "3. Дикий саблезубый Котёнок":
            return GetCharactersData.ViewModel(playerData: response.playerData, monsterData: response.kittenData)
        default:
            return GetCharactersData.ViewModel(playerData: response.playerData, monsterData: response.ogreData)
        }
    }
    
}

