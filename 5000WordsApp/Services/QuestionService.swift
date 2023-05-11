//
//  QuestionService.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 07.03.2023.
//

import Foundation

class QuestionService {
    var allWords: [WordModel] = []
    var currentWord: WordModel?
    
    private var jsonLoader = JsonLoader()
    
    var allWordsArchiver = WordsArchiver(type: .all)

    func fetchQuestions(jsonName: String)  {
        
        let words = allWordsArchiver.retrieve()
        
        if words.isEmpty {
            let words: [Word] = jsonLoader.loadJson(filename: jsonName) ?? []
            let shuffledWords = words.shuffled()
            let allWords: [WordModel] = convert(shuffledWords)
            self.allWords = allWords
            allWordsArchiver.save(allWords)
        } else {
            self.allWords = words
        }

    }
    
    func convert(_ words: [Word]) -> [WordModel] {
        
        var result: [WordModel] = []
        var allWords = words
        
        for word in allWords {
            
            //allWords.shuffle()
            
            let index1 = Int.random(in: 0..<allWords.count)
            let index2 = Int.random(in: 0..<allWords.count)
            let index3 = Int.random(in: 0..<allWords.count)
            
            var randomWords = [allWords[index1], allWords[index2], allWords[index3]]
            
            var variants = randomWords.map { $0.translate } //
            variants.append(word.translate)
            variants.shuffle()
            
            var currentWord = WordModel(word: word.word,
                                        correct: word.translate,
                                        variants: variants,
                                        id: word.id,
                                        order: word.order)
            result.append(currentWord)
        }
        
        return result
    }
    
    func nextQuestion() -> WordModel? {
        let word = allWords.removeFirst()
        //allWords.shuffle()
        
        //var variants = Array(allWords.prefix(3)).map { $0.translate }
        //variants.append(word.translate) //add correct translate
        //variants.shuffle()
        
//        var currentWord = WordModel(word: word.word,
//                                    correct: word.translate,
//                                    variants: variants,
//                                    id: word.id,
//                                    order: word.order)
        self.currentWord = word
        return currentWord
        
    }
}
