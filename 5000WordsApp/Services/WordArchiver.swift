//
//  WordArchiver.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 11.04.2023.
//

import Foundation

enum WordType: String {
    case all
    case known
    case unknown
}

final class WordsArchiver {
    
    private let encoder = JSONEncoder() //кодирует в бинарник
    private let decoder = JSONDecoder() //разкодирует

    private var key: String
    
    init(type: WordType) {
        self.key = type.rawValue
    }
    
    //MARK: - Public
    
    func add(_ word: WordModel) {
        
        var words = retrieve() // получаем массив слов из архивера
        words.append(word) // добавление в массив слов новое слово
        save(words) // сохранение массив слов в архивер
    }
    
    func save(_ words: [WordModel]) { //метод сохранить
        
        do {
            let data = try encoder.encode(words)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
        
    }
    //retrieve - получить данные
    func retrieve() -> [WordModel] {  //метод получить
        
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            
            let array = try decoder.decode([WordModel].self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
    
    func remove(_ word: WordModel) {
        
        var allWords = self.retrieve()
        allWords.removeAll { $0.id == word.id }
        self.save(allWords)
    }
}
