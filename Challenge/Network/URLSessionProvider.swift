//
//  URLSessionProvider.swift
//  NetworkLayer
//
//  Created by Yeshua Lagac on 7/22/24.
//

import Combine
import Foundation

class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {
    let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()

    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)

        if let parameters = endpoint.parameters {
            urlComponents?.queryItems = parameters.map {
                URLQueryItem(name: $0.key, value: ($0.value as AnyObject).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
            }
        }

        guard let finalURL = urlComponents?.url else {
            fatalError("Failed to create final URL with parameters")
        }

        var request = URLRequest(url: finalURL)
        request.httpMethod = endpoint.method.rawValue

        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200 ... 299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
