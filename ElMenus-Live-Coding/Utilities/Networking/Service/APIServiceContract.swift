//
//  APIServiceContract.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import Foundation
import Combine

protocol APIServiceContract {
    func request<T: Decodable>(
        request: URLRequest,
        decoder: JSONDecoder,
        response: T.Type
    ) -> AnyPublisher<T, Error>
}

extension APIServiceContract {
    func request<T: Decodable>(
        request: URLRequest,
        response: T.Type = T.self
    ) -> AnyPublisher<T, Error> {
        self.request(request: request, decoder: JSONDecoder(), response: response)
    }
}
