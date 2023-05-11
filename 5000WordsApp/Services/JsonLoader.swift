//
//  Decoder.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 01.03.2023.
//

import Foundation

class JsonLoader {

    func loadJson(filename fileName: String) -> [Word]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonResponse = try decoder.decode([Word].self, from: data)
                return jsonResponse
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}

