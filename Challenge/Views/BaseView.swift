//
//  BaseView.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/10/24.
//

import SwiftUI

struct BaseView: View {
    @StateObject private var viewModel: BaseViewModel
    @Environment(\.safeAreaInsets) private var safeAreaInsets

    init(module: Module) {
        _viewModel = StateObject(wrappedValue: BaseViewModel(module))
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationView(progress: viewModel.progress, isBackButtonHidden: viewModel.currentStep == 0, backTapped: {
                    withAnimation {
                        viewModel.updateStep(isNext: false)
                    }
                })
                .padding(.bottom, 12)

                screenView(for: viewModel.data.activity.screens[viewModel.currentStep])
                    .padding(.horizontal, 24)
                    .padding(.bottom, 5)
                    .background(Color.white)
                    .padding(.bottom)
            }
            .padding(.top, 4.29)
        }
        .edgesIgnoringSafeArea(.bottom)
    }

    private func screenView(for screen: Screen) -> some View {
        Group {
            switch screen {
            case let .question(screen):
                QandAView(question: screen, answers: $viewModel.answers, continueTapped: {
                    viewModel.updateStep(isNext: true)
                })
                .padding(.bottom, safeAreaInsets.bottom)
                .id(screen.id)
            case let .recap(recap):
                RecapView(recap: recap, continueTapped: {
                    viewModel.updateStep(isNext: true)
                })
                .id(recap.id)
            }
        }
        .transition(.opacity)
    }
}
