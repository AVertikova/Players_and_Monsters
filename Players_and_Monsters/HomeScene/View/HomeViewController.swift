//
//  HomeViewController.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayHomeScene()
}

class HomeViewController: UIViewController {
    
    private var presenter: HomePresentationLogic?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.presenter = presenter
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension HomeViewController: HomeDisplayLogic {
    func displayHomeScene() {
        
    }
}
