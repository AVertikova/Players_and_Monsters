//
//  HomeInteractor.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import Foundation

protocol HomeBusinessLogic {
    func fetchData()
}

class HomeInteractor {
    weak var presenter: HomePresentationLogic?
}

extension HomeInteractor: HomeBusinessLogic {
    func fetchData() {
        presenter?.presentHomeScene()

    }
}
