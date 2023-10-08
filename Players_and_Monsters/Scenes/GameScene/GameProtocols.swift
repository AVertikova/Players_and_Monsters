//
//  GameProtocols.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 07.10.2023.
//

import Foundation
import UIKit

// MARK: Game Properties protocols

protocol GameViewPropertiesProtocol: AnyObject {
    var presenter: GameViewToPresenterRequestProtocol? { get set }
}

protocol GamePresenterPropertiesProtocol: AnyObject {
    var viewController: GamePresenterToViewResponseProtocol? { get set }
    var interactor: GamePresenterToInteractorRequestProtocol? { get set }
    var router: GamePresenterToRouterRequestProtocol? { get set }
}

protocol GameInteractorPropertiesProtocol: AnyObject {
    var presenter: GameInteractorToPresenterResponseProtocol? { get set }
}

// MARK: Game Interaction protocols

protocol GameViewToPresenterRequestProtocol: AnyObject {
    func fetchData()
    
}

protocol GamePresenterToViewResponseProtocol: AnyObject {
    func showView()
    func showError()
}

protocol GamePresenterToInteractorRequestProtocol: AnyObject {
    func fetchData()
}

protocol GameInteractorToPresenterResponseProtocol: AnyObject {
    func fetchDataSuccess()
    func fetchDataFailed()
}

protocol GamePresenterToRouterRequestProtocol: AnyObject {
//    func pushToGameScene(navigationController: UINavigationController)
}

