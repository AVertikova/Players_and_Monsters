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
    
    @IBOutlet weak var attackButton: UIButton!
    @IBOutlet weak var healButton: UIButton!
    @IBOutlet weak var gameProcessTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.getGameData()
    }
    
    
    @IBAction func attackButtonTapped(_ sender: UIButton) {
            presenter?.attackButtonTapped(playerAttacks: playerAttacks)
            playerAttacks.toggle()
        if playerAttacks == false {
            attackButton.isEnabled = false
            healButton.isEnabled = false
            presenter?.attackButtonTapped(playerAttacks: playerAttacks)
            playerAttacks.toggle()
            attackButton.isEnabled = true
            healButton.isEnabled = true
        }
        
    }
    @IBAction func healButtonTapped(_ sender: UIButton) {
        presenter?.healButtonTapped()
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
    func showGameOver(dataToDisplay: String) {
        gameProcessTextView.text =
        gameProcessTextView.text + dataToDisplay
        attackButton.isEnabled = false
        healButton.isEnabled = false 
    }
    
    func showNoHealPillsView(dataToDisplay: String) {
        gameProcessTextView.text =
        gameProcessTextView.text + dataToDisplay
        healButton.isEnabled = false
        scrollTextViewToBottom(textView: gameProcessTextView)
    }
    
    func showView(dataToDisplay: String) {
        gameProcessTextView.text =
        gameProcessTextView.text + dataToDisplay
        scrollTextViewToBottom(textView: gameProcessTextView)
    }
    
    func scrollTextViewToBottom(textView: UITextView) {
        if textView.text.count > 0 {
            let location = textView.text.count - 1
            let bottom = NSMakeRange(location, 1)
            textView.scrollRangeToVisible(bottom)
        }
    }
}
