//
//  Recap.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import Foundation

struct Recap: Decodable {
    let id: String
    let eyebrow: String
    let body: String
    let answers: [Answer]
    let correctAnswer: String
}
