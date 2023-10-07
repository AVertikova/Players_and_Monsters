//
//  HomeViewController.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import UIKit

protocol HomeViewPropertiesProtocol: AnyObject {
    var presenter: HomeViewToPresenterRequestProtocol? { get set }
}

protocol HomePresenterToViewResponseProtocol: AnyObject {
    func showView()
    func showError()
}


class HomeViewController: UIViewController, HomeViewPropertiesProtocol {
    
    var presenter: HomeViewToPresenterRequestProtocol?

   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View: View is loaded now. Will ask presenter to start fetching data")
        print("===================================")
        print(presenter.self)
        print("===================================")
        presenter?.fetchData()
    }
    
    func debug(file: String = #file, line: Int = #line, function: String = #function) -> String {
        return "\(file):\(line) : \(function)"
    }
    
//    MARK: - Actions
    
    
    @IBAction func startGameButtonTapped(_ sender: Any) {
//        if let nController = navigationController {
//            print("View: Button is tapped on View. View will tell Presenter that button has been tapped")
//            presenter?.startGameButtonTapped(navigationController: nController)
//        }
    }
}


extension HomeViewController: HomePresenterToViewResponseProtocol {
    func showView() {
        print("View: Presenter has asked View to show itself")
    }
    
    func showError() {
        print("View: Presenter has asked view to show error")
    }
    
    
}
