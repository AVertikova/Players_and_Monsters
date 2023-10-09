//
//  GameInfoProtocols.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//
import Foundation
import UIKit


// MARK: GameInfo Properties protocols

protocol GameInfoViewPropertiesProtocol: AnyObject {
    var presenter: GameInfoViewToPresenterRequestProtocol? { get set }
}

protocol GameInfoPresenterPropertiesProtocol: AnyObject {
    var viewController: GameInfoPresenterToViewResponseProtocol? { get set }
    var interactor: GameInfoPresenterToInteractorRequestProtocol? { get set }
    var router: GameInfoPresenterToRouterRequestProtocol? { get set }
}

protocol GameInfoInteractorPropertiesProtocol: AnyObject {
    var presenter: GameInfoInteractorToPresenterResponseProtocol? { get set }
}

// MARK: GameInfo Interaction protocols

protocol GameInfoViewToPresenterRequestProtocol: AnyObject {
    func fetchCharactersData(request: GetCharactersData.Request)
    func startGameButtonTapped(navigationController: UINavigationController)
}

protocol GameInfoPresenterToViewResponseProtocol: AnyObject {
    func showView(viewModel: GetCharactersData.ViewModel)
    func showError()
}

protocol GameInfoPresenterToInteractorRequestProtocol: AnyObject {
    func fetchCharactersData(request: GetCharactersData.Request)
}

protocol GameInfoInteractorToPresenterResponseProtocol: AnyObject {
    func fetchGameData(response: GetCharactersData.Response)
    func createViewModel(response: GetCharactersData.Response) -> GetCharactersData.ViewModel
}

protocol GameInfoPresenterToRouterRequestProtocol: AnyObject {
    func pushToGameScene(navigationController: UINavigationController)
}

