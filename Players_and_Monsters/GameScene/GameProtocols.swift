//
//  GameProtocols.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 07.10.2023.
//

import Foundation
import UIKit

protocol GameViewPropertiesProtocol: AnyObject {
    var presenter: GameViewToPresenterProtocol? { get set }
}

protocol GamePresenterPropertiesProtocol: AnyObject {
    var viewController: GamePresenterToViewProtocol? { get set }
    var interactor: GamePresenterToInteractorProtocol? { get set }
    var router: GamePresenterToRouterProtocol? { get set }
}

protocol GameInteractorPropertiesProtocol: AnyObject {
    var presenter: GameInteractorToPresenterProtocol? { get set }
}

protocol GameViewToPresenterProtocol: AnyObject {
    func fetchData()
}

protocol GamePresenterToViewProtocol: AnyObject {
    func showView()
    func showError()
}

protocol GamePresenterToInteractorProtocol: AnyObject {
    func fetchData()
}

protocol GameInteractorToPresenterProtocol: AnyObject {
    func fetchDataSuccess()
    func fetchDataFailed()
}

protocol GamePresenterToRouterProtocol: AnyObject {
    func pushTo_XYZ(navigationController: UINavigationController)
}
