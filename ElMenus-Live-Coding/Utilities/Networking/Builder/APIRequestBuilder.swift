//
//  APIRequestBuilder.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import Foundation


class APIRequestBuilder {
    private(set) var urlRequest: URLRequest
    private let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
        guard let url = URL(string: baseURL) else {
            fatalError("Faild to create url from base url: \(APIConstants.baseURL)")
        }
        
        self.urlRequest = URLRequest(url: url)
    }
    
    func setPath(using path: APIConstants, query: [String: String]) -> APIRequestBuilder {
        let queryItems = query.map({ URLQueryItem(name: $0.key, value: $0.value) })
        var urlComponent = URLComponents(string: baseURL + path.rawValue)
        urlComponent?.queryItems = queryItems
        
        self.urlRequest.url = urlComponent?.url
        return self
    }
    
    func build() -> URLRequest {
        guard let _ = urlRequest.url else {
            fatalError("Faild to build url, url is empty")
        }
        
        return urlRequest
    }
}
