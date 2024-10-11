//
//  ChipShadow.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/10/24.
//

import SwiftUI

struct ChipShadow: ViewModifier {
    let isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .shadow(color: isSelected ? Color.black.opacity(0.08) : Color.clear, radius: 8, x: 0, y: 2)
    }
}
