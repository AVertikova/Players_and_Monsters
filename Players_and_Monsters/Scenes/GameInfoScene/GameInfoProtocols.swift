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
    func fetchData()
    func startGameButtonTapped(navigationController: UINavigationController)
}

protocol GameInfoPresenterToViewResponseProtocol: AnyObject {
    func showView()
    func showError()
}

protocol GameInfoPresenterToInteractorRequestProtocol: AnyObject {
    func fetchData()
}

protocol GameInfoInteractorToPresenterResponseProtocol: AnyObject {
    func fetchDataSuccess()
    func fetchDataFailed()
}

protocol GameInfoPresenterToRouterRequestProtocol: AnyObject {
    func pushToGameScene(navigationController: UINavigationController)
}

