//
//  WordArchiver.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 11.04.2023.
//

import Foundation

final class WordsArchiver {
    
    private let encoder = JSONEncoder() //кодирует в бинарник
    private let decoder = JSONDecoder() //разкодирует
    
    private let key = "Words"
    
    //MARK: - Public 
    func save(_ words: [Word]) { //метод сохранить
        
        do {
            let data = try encoder.encode(words)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    //retrieve - получить данные
    func retrieve() -> [Word] {  //метод получить
        
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            
            let array = try decoder.decode([Word].self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
}
