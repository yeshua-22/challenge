//
//  APIClient.swift
//  NetworkLayer
//
//  Created by Yeshua Lagac on 7/22/24.
//

import Foundation
import Combine

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}
