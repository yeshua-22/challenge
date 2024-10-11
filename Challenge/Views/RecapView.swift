//
//  RecapView.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/10/24.
//

import SwiftUI

struct RecapView: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @StateObject private var viewModel: RecapViewModel
    @Namespace private var animationNamespace
    var continueTapped: () -> Void

    init(recap: Recap, continueTapped: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: RecapViewModel(recap: recap))
        self.continueTapped = continueTapped
    }

    var body: some View {
        ZStack {
            if viewModel.isShowConfetti {
                GIFImageView(gifName: "confetti")
                    .frame(width: UIScreen.main.bounds.size.width - 100, height: 100)
                    .offset(y: UIScreen.main.bounds.size.height / 3)
                    .blendMode(.multiply)
            }

            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image("recap-icon")
                    Text("RECAP")
                        .font(.xxSmall)
                        .foregroundStyle(Color.systemOrange)
                    Spacer()
                }
                Text("Fill in the blank")
                    .font(.medium)
                    .padding(.top, 8)

                TagStack(horizontalSpacing: 4, verticalSpacing: -8) {
                    ForEach(viewModel.questions, id: \.id) { chip in
                        if let selectedAnswer = viewModel.selectedAnswer, selectedAnswer.text == chip.text {
                            ChipView(text: selectedAnswer.text, type: chip.type) {
                                withAnimation(.bouncy) {
                                    viewModel.reset()
                                }
                            }
                            .hidden()
                            .matchedGeometryEffect(id: selectedAnswer.text, in: animationNamespace)

                        } else {
                            ChipView(text: chip.text, type: chip.type)
                        }
                    }
                }
                .padding(.top, 30)

                TagStack(horizontalSpacing: 0, verticalSpacing: 8) {
                    ForEach(viewModel.recap.answers, id: \.id) { answer in
                        ZStack {
                            ChipView(text: answer.text, type: .selected, onTap: {
                                withAnimation(.bouncy) {
                                    viewModel.reset()
                                }
                            })
                            ChipView(text: answer.text, type: .default) {
                                withAnimation(.bouncy) {
                                    if viewModel.selectedAnswer?.id == answer.id {
                                        viewModel.reset()
                                    } else {
                                        viewModel.chooseAnswer(answer)
                                    }
                                }
                            }
                            .matchedGeometryEffect(id: answer.text, in: animationNamespace)
                        }
                        .offset(x: -5)
                    }
                }
                .padding(.top, 32)

                Spacer()

                AppButton(.primary, title: "Continue") {
                    withAnimation(.smooth(duration: 0.5)) {
                        viewModel.checkAnswer()
                    }
                }
            }
            .disabled(viewModel.feedback != nil)
            .padding(.bottom, safeAreaInsets.bottom)

            if let feedback = viewModel.feedback {
                FeedbackView(feedback: feedback, continueTapped: {
                    if feedback == .wrong {
                        withAnimation(.smooth(duration: 0.5)) {
                            viewModel.reset()
                        }
                    } else {
                        continueTapped()
                    }
                })
                .transition(.move(edge: .bottom))
                .padding(.horizontal, -24)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RecapView(recap: .init(id: "67qeDAR47kWIod0nSIsT6v",
                           eyebrow: "RECAP",
                           body: "Our angry %  RECAP  % fire quickly: “Act now, think later. Better safe than sorry.” Unfortunately in today’s world (without lions around) that motto often makes us do things we later regret.",
                           answers: [.init(id: "7ddxVru420D4EMowoOmhDc", text: "brains"), .init(id: "52F6vg1UBnlCzh6v8IihrA", text: "friends"), .init(id: "id", text: "bosses")],
                           correctAnswer: "7ddxVru420D4EMowoOmhDc"), continueTapped: {})
}

