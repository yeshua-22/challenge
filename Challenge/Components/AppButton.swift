//
//  AppButton.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/10/24.
//

import SwiftUI

enum ButtonStyle {
    case borderGray
    case borderViolet
    case primary
    case primaryDisabled

    var font: Font {
        switch self {
        case .primary, .primaryDisabled: return .small
        case .borderGray, .borderViolet: return .xSmall
        }
    }

    var titleColor: Color {
        switch self {
        case .primary, .primaryDisabled: return .white
        case .borderGray, .borderViolet: return .systemPrimary
        }
    }

    var borderColor: Color {
        switch self {
        case .borderGray: return .black.opacity(0.12)
        case .borderViolet: return .systemViolet
        default: return .clear
        }
    }

    var backgroundColor: Color {
        switch self {
        case .borderGray, .borderViolet: return .white
        case .primary, .primaryDisabled: return .systemViolet
        }
    }

    var borderWidth: CGFloat {
        switch self {
        case .borderGray, .borderViolet: return 1
        default: return 0
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .primary, .primaryDisabled: return 8
        case .borderGray, .borderViolet: return 12
        }
    }

    var isDisabled: Bool {
        switch self {
        case .primaryDisabled: return true
        default: return false
        }
    }

    var alignment: Alignment {
        switch self {
        case .borderGray, .borderViolet:
            return .leading
        default:
            return .center
        }
    }

    var shadow: (color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
        switch self {
        case .primary, .primaryDisabled:
            return (color: Color.systemViolet.opacity(0.3), radius: 16, x: 0, y: 5)
        default:
            return (color: .clear, radius: 0, x: 0, y: 0)
        }
    }
    
    var verticalPadding: CGFloat {
        switch self {
        case .primary, .primaryDisabled: return 14
        case .borderGray, .borderViolet: return 12
        }
    }
}

struct AppButton: View {
    let title: String
    let emoji: String?
    let style: ButtonStyle
    var onTapped: () -> Void

    init(_ style: ButtonStyle, title: String, emoji: String? = nil, onTapped: @escaping (() -> Void)) {
        self.style = style
        self.title = title
        self.emoji = emoji
        self.onTapped = onTapped
    }

    var body: some View {
        Button(action: onTapped) {
            HStack (alignment: .top, spacing: 14){
                Group {
                    if let emoji = emoji { 
                        Text(emoji)
                    }
                    Text(title)
                        .multilineTextAlignment(.leading)
                }
                .font(style.font)
                .foregroundStyle(style.titleColor)
                
                if style.alignment == .leading {
                    Spacer()
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, style.verticalPadding)
        }
        .frame(maxWidth: .infinity)
        .background(style.backgroundColor)
        .opacity(style.isDisabled ? 0.5 : 1)
        .disabled(style.isDisabled)
        .cornerRadius(style.cornerRadius)
        .shadow(color: style.shadow.color, radius: style.shadow.radius, x: style.shadow.x, y: style.shadow.y)
        .overlay(
            RoundedRectangle(cornerRadius: style.cornerRadius)
                .stroke(style.borderColor, lineWidth: style.borderWidth)
        )
    }
}

#Preview {
    VStack(spacing: 30) {
        AppButton(.primary, title: "Continue", onTapped: { })
        AppButton(.primaryDisabled, title: "Continue", onTapped: { })
        AppButton(.borderViolet, title: "Continue Continue Continue Continue Continue Continue Continue", emoji: "🤯", onTapped: { })
        AppButton(.borderGray, title: "Continue", onTapped: { })
    }
}
