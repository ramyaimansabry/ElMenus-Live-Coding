//
//  UniversitiesRepository.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import Combine

final class UniversitiesRepository {
    private let service: UniversitiesServiceContract
    
    init(service: UniversitiesServiceContract = UniversitiesService()) {
        self.service = service
    }
}

extension UniversitiesRepository: UniversitiesRepositoryContract {
    func search(for university: String) -> AnyPublisher<[UniversitiesResponse], Error> {
        return service
            .search(for: university)
    }
}
