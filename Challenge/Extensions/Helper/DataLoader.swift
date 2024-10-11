//
//  DataLoader.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import Foundation

class DataLoader {
    static func loadJson(_ fileName: String) -> Module? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("Failed to find activity_data.json in the bundle.")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            return try JSONParser.parseModule(from: data)
        } catch {
            print("Error loading or decoding JSON: \(error)")
            return nil
        }
    }
}
