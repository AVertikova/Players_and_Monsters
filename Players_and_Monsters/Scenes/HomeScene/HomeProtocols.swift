//
//  HomeProtocols.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import Foundation
import UIKit

// MARK: Home Properties protocols

protocol HomeViewPropertiesProtocol: AnyObject {
    var presenter: HomeViewToPresenterRequestProtocol? { get set }
}

protocol HomePresenterPropertiesProtocol: AnyObject {
    var viewController: HomePresenterToViewResponseProtocol? { get set }
    var interactor: HomePresenterToInteractorRequestProtocol? { get set }
    var router: HomePresenterToRouterRequestProtocol? { get set }
}

protocol HomeInteractorPropertiesProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterResponseProtocol? { get set }
}

// MARK: Home Interaction protocols

protocol HomeViewToPresenterRequestProtocol: AnyObject {
    func fetchData()
    func continueButtonTapped(navigationController: UINavigationController)
}

protocol HomePresenterToViewResponseProtocol: AnyObject {
    func showView(monsterTypes: [String])
    func showError()
}

protocol HomePresenterToInteractorRequestProtocol: AnyObject {
    func createGame(playerName: String, monsterType: String)
    func fetchData()
}


protocol HomeInteractorToPresenterResponseProtocol: AnyObject {
    func fetchDataSuccess(monsterTypes: [String])
    func fetchDataFailed()
}

protocol HomePresenterToRouterRequestProtocol: AnyObject {
    func pushToGameInfoScene(navigationController: UINavigationController)
}

