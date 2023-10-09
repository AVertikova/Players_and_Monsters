//
//  HomeDataStorage.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 09.10.2023.
//

import Foundation

enum GetHomeData {
    struct Request {}
    
    struct Response {
        let enemies: [String] = ["1. Ужасный-преужасный Огр",
                                 "2. Cтрашненький Скелет",
                                 "3. Дикий саблезубый Котёнок",
                                 "4. Выбери за меня" ]
    }
    
    struct ViewModel {
        var enemies: [String]?
    }
}
