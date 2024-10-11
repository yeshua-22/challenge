//
//  ProgressBar.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/10/24.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    var barHeight: CGFloat = 4
    var barColor: Color = .blue
    var backgroundColor: Color = .black.opacity(0.08)
    var cornerRadius: CGFloat = 8

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .frame(height: barHeight)

                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(barColor)
                    .frame(width: progress * geometry.size.width, height: barHeight)
            }
        }
        .frame(height: barHeight)
        .animation(.linear, value: progress)
    }
}

#Preview {
    ProgressBar(progress: 2)
        .padding(.horizontal)
}
