//
//  QuestionService.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 07.03.2023.
//

import Foundation

class QuestionService {
    var allWords: [Word] = []
    var currentWord: WordModel?
    private var jsonLoader = JsonLoader()

    func fetchQuestions(jsonName: String)  {
        allWords = jsonLoader.loadJson(filename: jsonName) ?? []
    }
    
    func nextQuestion() -> WordModel {
        let word = allWords.removeFirst()
        allWords.shuffle()
        
        var variants = Array(allWords.prefix(3)).map { $0.translate }
        variants.append(word.translate) //add correct translate
        variants.shuffle()
        
        var currentWord = WordModel(word: word.word,
                                    correct: word.translate,
                                    variants: variants,
                                    id: word.id,
                                    order: word.order)
        self.currentWord = currentWord
        return currentWord
        
    }
}
