//
//  Color+Extensions.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/10/24.
//

import SwiftUI

// We don't even need to create this.
// The Color.assets generate it's own static colors based on the `name`
// But it doesn't work in all Xcode versions
// So it's safer to use the static variables for now
extension Color {
    static let systemRed = Color("AppRed")
    static let systemGreen = Color("AppGreen")
    static let systemViolet = Color("AppViolet")
    static let systemPrimary = Color("AppPrimary")
    static let systemPrimary06 = Color("AppPrimary06")
    static let systemOrange = Color("AppOrange")
}
