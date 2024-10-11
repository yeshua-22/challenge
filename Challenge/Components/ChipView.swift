//
//  ChipView.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/10/24.
//

import SwiftUI

struct `Chip` {
    let id = UUID()
    var text: String
    var type: ChipType
}

enum ChipType {
    case blank
    case primary
    case `default`
    case selected
}

struct ChipView: View {
    let text: String
    let type: ChipType
    var onTap: (() -> Void)?

    var body: some View {
        Text(text)
            .font(font)
            .foregroundColor(foregroundColor)
            .padding(.vertical, 9)
            .padding(.horizontal, horizontalPadding)
            .background(backgroundColor)
            .cornerRadius(8)
            .shadow(color: shadow.color, radius: shadow.radius, x: shadow.x, y: shadow.y)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: 1)
            )
            .padding(.horizontal, type == .default ? 5 : 0)
            .onTapGesture {
                onTap?()
            }
            .disabled(type == .primary && type == .blank)
    }

    private var font: Font {
        switch type {
        case .blank, .primary:
        return .regularLarge
        default:
            return .small
        }
    }
    
    var horizontalPadding: CGFloat {
        switch type {
        case .blank, .primary:
            return 0
        default:
            return 16
        }
    }
    
    var shadow: (color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
        switch type {
        case .default:
            return (color: .black.opacity(0.08), radius: 8, x: 0, y: 2)
        default:
            return (color: .clear, radius: 0, x: 0, y: 0)
        }
    }

    private var backgroundColor: Color {
        switch type {
        case .blank, .primary:
            return Color.white
        case .default:
            return Color.white
        case .selected:
            return Color.gray.opacity(0.2)
        }
    }

    private var foregroundColor: Color {
        switch type {
        case .primary, .blank:
            return Color.appPrimary06
        case .default:
            return Color.black
        default:
            return Color.clear
        }
    }

    private var borderColor: Color {
        switch type {
        case .primary, .blank:
            return Color.clear
        default:
            return Color.black.opacity(0.06)
        }
    }
}

#Preview {
    VStack {
        ChipView(text: "Answer 1", type: .blank)
        ChipView(text: "Answer 2", type: .default)
        ChipView(text: "Answer 3", type: .selected)
        ChipView(text: "Answer 4", type: .blank)
    }
}
