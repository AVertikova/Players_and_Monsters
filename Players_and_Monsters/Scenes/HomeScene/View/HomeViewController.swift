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
        self.getData()
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
            presenter?.saveChoice(playerName: playerNameTextField.text ?? "", monsterType: enemyTextField.text ?? "")
            presenter?.continueButtonTapped(navigationController: nController)
        }
        
    }
    
    func getData() {
        let request = GetHomeData.Request()
        presenter?.fetchChoiceData(request: request)
    }
}


extension HomeViewController: HomePresenterToViewResponseProtocol {
    func showView(response: GetHomeData.Response) {
        enemyPickerData = response.enemies
    }
    
    func showError() {
    }
    
    
}


