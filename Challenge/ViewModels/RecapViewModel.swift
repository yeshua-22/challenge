//
//  RecapViewModel.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import Foundation

class RecapViewModel: ObservableObject {
    @Published var questions: [Chip] = []
    @Published var selectedAnswer: Answer? = nil
    @Published var isShowConfetti: Bool = false
    @Published var feedback: Feedback?

    let recap: Recap
    let blank: String = "________"
    private var previousValue: String = "________"

    var canContinue: Bool {
        guard let selectedAnswer = selectedAnswer else { return false }
        return selectedAnswer.id == recap.correctAnswer
    }

    init(recap: Recap) {
        self.recap = recap
        buildQuestions()
    }

    func buildQuestions() {
        let arrayBody = SentenceParser(sentence: recap.body).parseSentence()
        questions = arrayBody.map { word in
            let chipType: ChipType = (word == "________") ? .blank : .primary
            return Chip(text: word, type: chipType)
        }
    }

    func checkAnswer() {
        feedback = selectedAnswer?.id == recap.correctAnswer ? .correct : .wrong
        isShowConfetti = feedback == .correct
    }

    func reset() {
        selectedAnswer = nil
        buildQuestions()
        previousValue = blank
        feedback = nil
    }

    func chooseAnswer(_ answer: Answer) {
        selectedAnswer = answer
        if let index = questions.firstIndex(where: { $0.text == previousValue }) {
            questions[index].text = selectedAnswer?.text ?? blank
            questions[index].type = .default
            previousValue = questions[index].text
        }
    }
}
