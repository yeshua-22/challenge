//
//  EnvironmentValue+Extensions.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import Foundation
import SwiftUI

private struct SafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            guard let safeAreaInsets = windowScene.windows.first?.safeAreaInsets else {
                return EdgeInsets()
            }
            return EdgeInsets(top: safeAreaInsets.top,
                              leading: safeAreaInsets.left,
                              bottom: safeAreaInsets.bottom,
                              trailing: safeAreaInsets.right)
        }
        return EdgeInsets()
    }
}

extension EnvironmentValues {
    var safeAreaInsets: EdgeInsets {
        get { self[SafeAreaInsetsKey.self] }
        set { self[SafeAreaInsetsKey.self] = newValue }
    }
}

private extension UIEdgeInsets {
    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
