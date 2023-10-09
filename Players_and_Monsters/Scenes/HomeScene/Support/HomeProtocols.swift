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
    func saveChoice(playerName: String, monsterType: String)
    func fetchChoiceData(request: GetHomeData.Request)
    func continueButtonTapped(navigationController: UINavigationController)
}

protocol HomePresenterToViewResponseProtocol: AnyObject {
    func showView(response: GetHomeData.Response)
    func showError()
}

protocol HomePresenterToInteractorRequestProtocol: AnyObject {
    func saveChoice(playerName: String, monsterType: String)
    func fetchChoiceData(request: GetHomeData.Request)
}


protocol HomeInteractorToPresenterResponseProtocol: AnyObject {
    func fetchChoiceDataSuccess(response: GetHomeData.Response)
    func fetchChoiceDataFailed()
}

protocol HomePresenterToRouterRequestProtocol: AnyObject {
    func pushToGameInfoScene(navigationController: UINavigationController)
}

