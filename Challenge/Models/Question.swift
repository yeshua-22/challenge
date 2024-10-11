//
//  Question.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import Foundation


struct Question: Decodable {
    let id: String
    let title: String
    let multipleChoicesAllowed: Bool
    let choices: [Choice]
    
    private enum CodingKeys: String, CodingKey {
        case id, multipleChoicesAllowed, choices
        case title = "question"
    }
}
