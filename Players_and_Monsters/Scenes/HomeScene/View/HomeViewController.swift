//
//  HomeViewController.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 06.10.2023.
//

import UIKit




class HomeViewController: UIViewController, HomeViewPropertiesProtocol {
    
    
    var presenter: HomeViewToPresenterRequestProtocol?
    
    @IBOutlet weak var playerNameTextField: UITextField!
    
    var enemyPickerView = UIPickerView()
    var enemyPickerData: [String] = []
    
    @IBOutlet weak var enemyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        print("HomeView: View is loaded now. Will ask presenter to start fetching data")
//        var enemyPickerData: [String] = 
        presenter?.fetchData()
        setup()
    }
    
    func setup() {
        enemyPickerView.delegate = self
        enemyPickerView.dataSource = self
        enemyTextField.inputView = enemyPickerView
    }
    
    
    //    MARK: - Actions
    
    
    @IBAction func proceedButtonTapped(_ sender: Any) {
        if let nController = navigationController {
            print("HomeView: Button is tapped on View. View will tell Presenter that button has been tapped")
            presenter?.continueButtonTapped(navigationController: nController)
        }
        
    }
}


extension HomeViewController: HomePresenterToViewResponseProtocol {
    func showView(monsterTypes: [String]) {
        print("HomeView: Presenter has asked View to show itself")
        enemyPickerData = monsterTypes
    }
    
    func showError() {
        print("HomeView: Presenter has asked view to show error")
    }
    
    
}


