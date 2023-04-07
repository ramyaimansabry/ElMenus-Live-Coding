//
//  APIService.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    
    private init() {}
    
    private lazy var session: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()
}

extension APIService: APIServiceContract {
    func request<T: Decodable>(
        request: URLRequest,
        decoder: JSONDecoder,
        response: T.Type
    ) -> AnyPublisher<T, Error> {
        return session
            .dataTaskPublisher(for: request)
            .tryMap({ $0.data })
            .decode(type: response, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
