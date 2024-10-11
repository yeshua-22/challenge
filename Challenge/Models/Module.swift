//
//  Module.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import Foundation

struct Module: Decodable, Identifiable {
    let id: String
    let state: String
    let stateChanged: Date?
    let title: String
    let description: String
    let duration: String
    let activity: Activity
}
