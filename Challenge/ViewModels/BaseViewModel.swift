//
//  BaseViewModel.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    let data: Module

    @Published var currentStep: Int = 0
    @Published var progress: Double = 0
    @Published var isShowQuestionaires: Bool = false

    @Published var answers: [Answer] = []

    init(_ module: Module) {
        data = module
        updateProgress()
    }

    func goToMain() {
        isShowQuestionaires = false
    }

    func start() {
        withAnimation {
            isShowQuestionaires = true
        }
    }

    func updateProgress() {
        let totalSteps: Int = data.activity.screens.count
        progress = Double(currentStep) / Double(totalSteps)
    }

    func updateStep(isNext: Bool = false) {
        withAnimation {
            if isNext {
                if currentStep + 1 < data.activity.screens.count {
                    currentStep += 1
                } else {
                    currentStep = 0
                    isShowQuestionaires = false
                }
            } else {
                if currentStep > 0 {
                    currentStep -= 1
                }
            }
            updateProgress()
        }
    }
}
