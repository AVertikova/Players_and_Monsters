//
//  GameView.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation
import UIKit


class GameViewController: UIViewController, GameViewPropertiesProtocol {
    var presenter: GameViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n\nGame View Controller Loaded\n\n")
        presenter?.fetchData()
    }
}

extension GameViewController: GamePresenterToViewProtocol {
    func showView() {
        
    }
    
    func showError() {
    }
}
