//
//  NavigationView.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/10/24.
//

import SwiftUI

struct NavigationView: View {
    @Environment(\.presentationMode) var presentationMode

    let progress: CGFloat
    var isBackButtonHidden: Bool = true
    var backTapped: (() -> Void)
    
    var body: some View {
        VStack (spacing: 16){
            ProgressBar(progress: progress)
                .padding(.horizontal, 16)
            HStack {
                if !isBackButtonHidden {
                    Button(action: {
                        backTapped()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .fontWeight(.medium)
                    })
                }
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .fontWeight(.medium)
                })
            }
            .foregroundStyle(Color.systemPrimary06)
            .padding(.horizontal, 21)
        }
    }
}

#Preview {
    NavigationView(progress: 0, isBackButtonHidden: true, backTapped: {})
}
