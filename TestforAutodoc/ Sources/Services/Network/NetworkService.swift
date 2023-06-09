//
//  NetworkService.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 27.03.2023.
//

import Foundation
import Combine

final class NetworkService: NetworkServiceType {
    
    
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: URLSessionConfiguration.ephemeral)) {
        self.session = session
    }
    
    @discardableResult
    func load<T>(_ resource: Resource<T>) -> AnyPublisher<T, Error>  {
        guard let request = resource.request else {
            return .fail(NetworkError.invalidRequest)
        }
        return session.dataTaskPublisher(for: request)
            .mapError { _ in NetworkError.invalidRequest }
            .print()
            .flatMap { data, response -> AnyPublisher<Data, Error> in
                guard let response = response as? HTTPURLResponse else {
                    return .fail(NetworkError.invalidResponse)
                }
                guard 200..<300 ~= response.statusCode else {
                    return .fail(NetworkError.dataLoadingError(statusCode: response.statusCode, data: data))
                }
                return .just(data)
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
