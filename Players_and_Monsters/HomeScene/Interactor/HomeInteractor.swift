//
//  HomeInteractor.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation

protocol HomeInteractorPropertiesProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterResponseProtocol? { get set }
}

protocol HomePresenterToInteractorRequestProtocol: AnyObject {
    func fetchData()
}

class HomeInteractor: HomeInteractorPropertiesProtocol {
   weak var presenter: HomeInteractorToPresenterResponseProtocol?
}

extension HomeInteractor: HomePresenterToInteractorRequestProtocol {
    func fetchData() {
        print("Interactor: Got Request from Presenter to fetch data. Will give presenter the required data.")
//        fetch data
        presenter?.fetchDataSuccess()

    }
}
