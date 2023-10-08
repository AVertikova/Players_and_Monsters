//
//  HomeViewController+EnemyPickerView.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 08.10.2023.
//

import Foundation
import UIKit


extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return enemyPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return enemyPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        enemyTextField.text = enemyPickerData[row]
        self.view.endEditing(true)
    }
}
