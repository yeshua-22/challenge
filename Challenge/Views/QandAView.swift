//
//  QandAView.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/10/24.
//

import SwiftUI

struct QandAView: View {
    @StateObject var viewModel: QandAViewModel
    @Binding var answers: [Answer]

    var continueTapped: () -> Void

    init(question: Question, answers: Binding<[Answer]>, continueTapped: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: QandAViewModel(question: question))
        _answers = answers
        self.continueTapped = continueTapped
    }

    var body: some View {
        VStack(spacing: 12) {
            VStack(spacing: 16) {
                Text(viewModel.question.title)
                    .font(.lesson)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                if viewModel.question.multipleChoicesAllowed {
                    Text("Select all that apply")
                        .font(.small)
                        .foregroundStyle(Color.systemPrimary06)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            Spacer()
            ForEach(viewModel.question.choices, id: \.id) { choice in
                AppButton(viewModel.isSelected(choice.id) ? .borderViolet : .borderGray, title: "\(choice.emoji) \(choice.text)") {
                    withAnimation {
                        viewModel.handleSelection(choice.id)
                        answers = viewModel.selectedAnswers.map { Answer(id: $0, text: choice.text) }
                        if !viewModel.question.multipleChoicesAllowed {
                            continueTapped()
                        }
                    }
                }
            }

            if viewModel.question.multipleChoicesAllowed {
                AppButton(viewModel.canContinue ? .primary : .primaryDisabled, title: "Continue") {
                    continueTapped()
                }
                .padding(.top, 12)
            }
        }
        .background(Color.white)
    }
}

#Preview {
    QandAView(question: .init(id: "3wAyd4fwsS8L2BqIHeBrxe", title: "So, what regrettable things have you done in anger? (Don’t worry, we won’t tell).", multipleChoicesAllowed: false, choices: [
        .init(id: "2JT0IQXgUnixdNj9NeUV4l", text: "Yelling", emoji: "🤬"),
        .init(id: "64ek3cOv9ISLNpjommiIna", text: "Angrily ruminating/plotting revenge", emoji: "😠"),
        .init(id: "6Yz4DwJtvkLiOFA9zw8Cqf", text: "Giving people the cold shoulder", emoji: "😒"),
        .init(id: "fuwVu4UESHnMRryJFA7Bq", text: "Mocking/insulting someone", emoji: "😈"),
        .init(id: "1u0qT3sPS2WYirdTgwP7TF", text: "Emitting steam from your ears (handy on cold days!)", emoji: "😤"),
        .init(id: "5UlTno3DGrs2k5PCLIJeoW", text: "None of the above, I’m zen", emoji: "❌"),
    ]), answers: .constant([]), continueTapped: {})
}
