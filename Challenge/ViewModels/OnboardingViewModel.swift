//
//  OnboardingViewModel.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import SwiftUI
import Combine

class OnboardingViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let questionService: QuestionService = QuestionService()

    @Published var module: Module?
    @Published var proceedToQuestions: Bool = false
    @Published var isFetching = false

    func decodeUsingLocalFile() {
        module = DataLoader.loadJson("activity_data")
    }

    func fetchDataUsingAPI() {
        isFetching.toggle()
        questionService.getData()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                self.isFetching.toggle()
                switch completion {
                case .finished:
                    print("Finished successfully.")
                case let .failure(error):
                    print("Failed with error: \(error)")
                }
            }, receiveValue: { [weak self] data in
                withAnimation(.easeInOut) {
                    self?.module = data
                }
            }).store(in: &cancellables)
    }
}
