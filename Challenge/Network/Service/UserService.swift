//
//  Question.swift
//  NetworkLayer
//
//  Created by Yeshua Lagac on 7/22/24.
//

import Combine
import Foundation

protocol QuestionServiceProtocol {
    func getData() -> AnyPublisher<Module, Error>
}

class QuestionService: QuestionServiceProtocol {
    let apiClient = URLSessionAPIClient<QuestionEndpoint>()
    func getData() -> AnyPublisher<Module, any Error> {
        return apiClient.request(.getData)
    }
}
