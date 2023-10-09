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
    private var playerAttacks: Bool = true
    
    @IBOutlet weak var gameProcessTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.getGameData()
    }
    
    
    @IBAction func attackButtonTapped(_ sender: UIButton) {
        presenter?.attackButtonTapped(playerAttacks: playerAttacks)
    }
    
    func setup(){
        gameProcessTextView.text = """
Да начнётся боооооой!!!

Ты бьёшь первым, противник бьёт сам.
И лечится тоже сам.

Когда будешь готов, нажми кнопку.


"""
    }
    
    func getGameData() {
        let request = GetGameData.GameInitRequest()
        presenter?.fetchGame(request: request)
    }
}

extension GameViewController: GamePresenterToViewResponseProtocol {
    func showView() {
        
    }
    
    func showError() {
    }
}
