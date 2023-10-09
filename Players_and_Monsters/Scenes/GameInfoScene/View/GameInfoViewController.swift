//
//  GameInfoViewController.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import UIKit

class GameInfoViewController: UIViewController, GameInfoViewPropertiesProtocol {
    var presenter: GameInfoViewToPresenterRequestProtocol?
    
    @IBOutlet weak var playerDataTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCharactersData()
        
    }
    
    @IBAction func startGameButtonTapped(_ sender: Any) {
        if let nController = navigationController {
            presenter?.startGameButtonTapped(navigationController: nController)
        }
        
    }
    
    func getCharactersData() {
        let request = GetCharactersData.Request()
        presenter?.fetchCharactersData(request: request)
    }
    
    
}

extension GameInfoViewController: GameInfoPresenterToViewResponseProtocol {
    func showView(viewModel: GetCharactersData.ViewModel) {

        playerDataTextView.text = "\(viewModel.playerData ?? "")\n\n\(viewModel.monsterData ?? "")"
    }
    
    func showError() {
        playerDataTextView.text = "Ой, что-то пошло не так"
    }
    
    
}
