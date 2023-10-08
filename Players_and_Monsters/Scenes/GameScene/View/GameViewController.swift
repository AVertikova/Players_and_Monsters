//
//  GameViewController.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 27.09.2023.
//

import Foundation
import UIKit


class GameViewController: UIViewController, GameViewPropertiesProtocol {
    var presenter: GameViewToPresenterRequestProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n\nGame View Controller Loaded\n\n")
        presenter?.fetchData()
    }
}

extension GameViewController: GamePresenterToViewResponseProtocol {
    func showView() {
        
    }
    
    func showError() {
    }
}
