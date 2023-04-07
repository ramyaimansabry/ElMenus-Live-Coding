//
//  UniversitiesService.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import Combine

final class UniversitiesService {
    private let apiService: APIServiceContract
    
    init(apiService: APIServiceContract = APIService.shared) {
        self.apiService = apiService
    }
}

extension UniversitiesService: UniversitiesServiceContract {
    func search(for university: String) -> AnyPublisher<[UniversitiesResponse], Error> {
        let request = APIRequestBuilder(baseURL: APIConstants.baseURL.rawValue)
            .setPath(using: .searchForUni, query: ["country": university])
            .build()
        
        return apiService
            .request(
                request: request,
                response: [UniversitiesResponse].self
            )
    }
}

