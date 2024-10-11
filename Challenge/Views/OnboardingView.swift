//
//  OnboardingView.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/10/24.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel = OnboardingViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Image("banner")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, -24)

            if let module = viewModel.module {
                Text(module.title)
                    .font(.mediumTitle)

                HStack {
                    Group {
                        Text("Noticing")
                            .font(.small)
                        Text("•")
                    }
                    .foregroundStyle(Color.systemPrimary06)

                    Group {
                        Image(systemName: "clock")
                            .foregroundStyle(Color.systemPrimary)
                        Text(module.duration)
                            .font(.small)
                    }
                    .foregroundStyle(Color.systemPrimary)
                }

                Text(module.description)
                    .font(.regular)
                    .foregroundStyle(Color.appPrimary06)

                Spacer()
                AppButton(.primary, title: "Let's go") {
                    viewModel.proceedToQuestions = true
                }
                .padding(.bottom)

            } else {
                VStack(spacing: 30) {
                    Spacer()

                    AppButton(.primary, title: "Decode using Local File") {
                        withAnimation(.easeInOut) {
                            viewModel.decodeUsingLocalFile()
                        }
                    }
                    .disabled(viewModel.isFetching)

                    AppButton(.primary, title: "Fetch using API") {
                        viewModel.fetchDataUsingAPI()
                    }
                    .disabled(viewModel.isFetching)

                    ProgressView {
                        Text("Fetching Data")
                            .font(.lesson)
                    }
                    .opacity(viewModel.isFetching ? 1 : 0)

                    Spacer()
                }
            }
        }
        .padding(.horizontal, 24)
        .ignoresSafeArea(edges: .top)
        .fullScreenCover(isPresented: $viewModel.proceedToQuestions, content: {
            if let module = viewModel.module {
                BaseView(module: module)
            }
        })
    }
}
#Preview {
    OnboardingView()
}
