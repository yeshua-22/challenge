//
//  Activity.swift
//  Challenge
//
//  Created by Yeshua Lagac on 10/11/24.
//

import Foundation

enum ScreenType: String, Decodable {
    case question = "multipleChoiceModuleScreen"
    case recap = "recapModuleScreen"
}

enum Screen: Decodable {
    case question(Question)
    case recap(Recap)

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(ScreenType.self, forKey: .type)
        
        switch type {
        case .question:
            let screen = try Question(from: decoder)
            self = .question(screen)
        case .recap:
            let screen = try Recap(from: decoder)
            self = .recap(screen)
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case type
    }

}

struct Activity: Decodable {
    let screens: [Screen]
}
