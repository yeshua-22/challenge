//
//  SentenceParser.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import Foundation

struct SentenceParser {
    private let sentence: String
    private let blank: String

    init(sentence: String, blank: String = "________") {
        self.sentence = sentence
        self.blank = blank
    }

    func parseSentence() -> [String] {
        return sentence.replacingOccurrences(of: "%  RECAP  %", with: blank)
            .components(separatedBy: " ")
    }
}
