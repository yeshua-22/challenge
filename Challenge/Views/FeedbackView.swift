//
//  FeedbackView.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import SwiftUI

enum Feedback: String, Identifiable {
    case correct = "You're correct"
    case wrong = "Try again"

    var id: String {
        rawValue
    }
}

struct FeedbackView: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    let feedback: Feedback
    let continueTapped: () -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            VStack(alignment: .leading) {
                Rectangle()
                    .fill(feedback == .correct ? Color.systemGreen : Color.red)
                    .frame(height: 4)
                    .shadow(color: .black.opacity(0.06), radius: 12, x: 0, y: -4)

                Group {
                    Text(feedback.rawValue)
                        .font(.medium)
                }
                .padding(.horizontal)
                .padding(.top, 20)

                AppButton(.primary, title: "Continue") {
                    continueTapped()
                }
                .padding()
            }
            .padding(.bottom, safeAreaInsets.bottom)
            .background(Color.white.shadow(color: Color.black.opacity(0.05),
                                           radius: 5,
                                           x: 0,
                                           y: -15))
        }
    }
}

#Preview {
    FeedbackView(feedback: .correct, continueTapped: {})
}
