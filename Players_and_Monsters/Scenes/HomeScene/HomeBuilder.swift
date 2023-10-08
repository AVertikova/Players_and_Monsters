//
//  HomeSceneBuilder.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation
import UIKit

class HomeBuilder {
    static func createModule() -> HomeViewController {
        print("Home Module Creation")
        let homeViewController =  UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let presenter: HomePresenterPropertiesProtocol & HomeViewToPresenterRequestProtocol & HomeInteractorToPresenterResponseProtocol = HomePresenter()
        let interactor: HomeInteractorPropertiesProtocol & HomePresenterToInteractorRequestProtocol = HomeInteractor()
        let router: HomePresenterToRouterRequestProtocol = HomeRouter()
      
        homeViewController.presenter = presenter
       
        presenter.viewController = homeViewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return homeViewController
    }
}
