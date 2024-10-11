//
//  QuestionEndpoint.swift
//  NetworkLayer
//
//  Created by Yeshua Lagac on 7/22/24.
//

import Foundation

enum QuestionEndpoint: APIEndpoint {
    case getData
    var baseURL: URL {
        URL(string: "https://file.notion.so/")!
    }

    var path: String {
        switch self {
        case .getData:
            return "f/f/e430ac3e-ca7a-48f9-804c-8fe9f7d4a267/174c6c45-c116-4762-8550-607cddb04270/activity-response-ios.json"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getData:
            return .get
        }
    }

    var headers: [String: String]? {
        switch self {
        case .getData:
            return nil
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .getData:
            return [
                "table": "block",
                "id": "111284a8-e7d3-80ea-a701-fad40b7b30ca",
                "spaceId": "e430ac3e-ca7a-48f9-804c-8fe9f7d4a267",
                "expirationTimestamp": "1728720000000",
                "signature": "FU68uhOygC1L7XNOspVCglX0LPvB3icE9k5QDIoOGFI",
                "downloadName": "activity-response-ios.json"
            ]
        }
    }
    
    var parametersEncoding: ParametersEncoding {
        switch self {
        default:
            return .url
        }
    }
}
