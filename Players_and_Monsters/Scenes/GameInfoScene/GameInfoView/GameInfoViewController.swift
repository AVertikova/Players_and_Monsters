//
//  GameInfoViewController.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import UIKit

class GameInfoViewController: UIViewController, GameInfoViewPropertiesProtocol {
    var presenter: GameInfoViewToPresenterRequestProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n\nGame INFO View Controller Loaded\n\n")
        presenter?.fetchData()
    }
    
    @IBAction func startGameButtonTapped(_ sender: Any) {
        if let nController = navigationController {
            print("GIView: Button is tapped on View. View will tell Presenter that button has been tapped")
            presenter?.startGameButtonTapped(navigationController: nController)
        }
        
    }
}

extension GameInfoViewController: GameInfoPresenterToViewResponseProtocol {
    func showView() {
        
    }
    
    func showError() {
        
    }
    
    
}
