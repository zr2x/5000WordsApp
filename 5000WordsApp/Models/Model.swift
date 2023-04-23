//
//  Model.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 01.03.2023.
//

import Foundation


/// Модель при парсинге json
struct Word: Codable{
    let id: Int
    let word: String
    let translate: String
    let order: Int
}

/// Модель для отображения
struct WordModel: Codable  {
    var word: String
    var correct: String
    var variants: [String]
    var id: Int
    var order: Int
}



