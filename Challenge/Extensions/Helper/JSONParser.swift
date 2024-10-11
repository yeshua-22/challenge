//
//  JSONParser.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import Foundation

struct JSONParser {
    static func parseModule(from jsonData: Data) throws -> Module {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        return try decoder.decode(Module.self, from: jsonData)
    }
}
