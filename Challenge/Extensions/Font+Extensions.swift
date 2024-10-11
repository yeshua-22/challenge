//
//  Font+Extensions.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/10/24.
//

import SwiftUI

extension Font {
    static let xxSmall = Font.custom("EuclidCircularB-Medium", size: 12)
    static let xSmall = Font.custom("EuclidCircularB-Medium", size: 14)
    
    static let regular = Font.custom("EuclidCircularB-Regular", size: 18)
    static let regularLarge = Font.custom("EuclidCircularB-Regular", size: 22)

    static let medium = Font.custom("EuclidCircularB-Medium", size: 18)
    static let lesson = Font.custom("EuclidCircularB-Medium", size: 22)
    static let small = Font.custom("EuclidCircularB-Medium", size: 16)
    static let mediumTitle = Font.custom("EuclidCircularB-Medium", size: 28)
}

struct FontsView: View {
    var body: some View {
        VStack (spacing: 10) {
            Text("RECAP")
                .font(.xxSmall)
                .foregroundStyle(Color.systemOrange)
            
            Text("To better control our angry emotions")
                .font(.regular)
                .foregroundStyle(Color.systemPrimary06)

            
            Text("Fill in the blanks")
                .font(.medium)
                .foregroundStyle(Color.systemPrimary)

            Text("Our brains make us miserable")
                .font(.lesson)
                .foregroundStyle(Color.systemPrimary06)
            
            Text("Check")
                .font(.small)
                .foregroundStyle(Color.white)
                .padding()
                .background(Color.appViolet)
            
            Text("The key to calm: Coming back to your senses")
                .font(.mediumTitle)


        }
        
    }
}

#Preview {
    FontsView()
}
