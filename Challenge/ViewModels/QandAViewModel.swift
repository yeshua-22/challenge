//
//  QandAViewModel.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import Foundation

class QandAViewModel: ObservableObject {
    let question: Question

    init(question: Question) {
        self.question = question
    }

    @Published var selectedAnswers: [String] = []
    
    var canContinue: Bool {
        return selectedAnswers.count > 0
    }

    func isSelected(_ choiceID: String) -> Bool {
        selectedAnswers.contains(choiceID)
    }

    func handleSelection(_ choiceID: String) {
        if isSelected(choiceID) {
            deselectChoice(choiceID)
        } else {
            selectChoice(choiceID)
        }
    }

    private func deselectChoice(_ choiceID: String) {
        guard question.multipleChoicesAllowed else { return }
        selectedAnswers.removeAll(where: { $0 == choiceID })
    }

    private func selectChoice(_ choiceID: String) {
        if question.multipleChoicesAllowed {
            selectedAnswers.append(choiceID)
        } else {
            selectedAnswers = [choiceID]
        }
    }
}
