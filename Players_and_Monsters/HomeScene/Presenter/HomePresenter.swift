//
//  HomePresenter.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation
import UIKit

protocol HomePresenterPropertiesProtocol: AnyObject {
    var viewController: HomePresenterToViewResponseProtocol? { get set }
    var interactor: HomePresenterToInteractorRequestProtocol? { get set }
    var router: HomePresenterToRouterRequestProtocol? { get set }
}

protocol HomeViewToPresenterRequestProtocol: AnyObject {
    func fetchData()
    func startGameButtonTapped(navigationController: UINavigationController)
}

protocol HomeInteractorToPresenterResponseProtocol: AnyObject {
    func fetchDataSuccess()
    func fetchDataFailed()
}


class HomePresenter: HomePresenterPropertiesProtocol {
    weak var viewController: HomePresenterToViewResponseProtocol?
    var interactor: HomePresenterToInteractorRequestProtocol?
    var router: HomePresenterToRouterRequestProtocol?
   
}

extension HomePresenter: HomeViewToPresenterRequestProtocol {
    
    func fetchData() {
        print("Presenter: Got request from View to fetch Data. Presenter Will now ask Interactor to do so")
        interactor?.fetchData()
    }
    
    func startGameButtonTapped(navigationController: UINavigationController) {
        print("Presenter: View told presenter that button has been tapped. Now Presenter will tell Router to perform required actions")
        router?.pushToGameScene(navigationController: navigationController)
    }
    
}
extension HomePresenter: HomeInteractorToPresenterResponseProtocol {
    func fetchDataSuccess() {
        print("Presenter: Interactor has successfully given Presenter the data. Now Presenter will tell View to show everything it has")
        viewController?.showView()
    }
    
    func fetchDataFailed() {
        print("Presenter: Interactor has successfully told Presenter that the data fetch has failed. Now Presenter will tell View to show error")
        viewController?.showError()
    }
    
    
}
