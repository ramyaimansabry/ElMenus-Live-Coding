//
//  SearchForUniversityUseCase.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import Combine

final class SearchForUniversityUseCase {
    private let repository: UniversitiesRepositoryContract
    
    init(repository: UniversitiesRepositoryContract = UniversitiesRepository()) {
        self.repository = repository
    }
}

extension SearchForUniversityUseCase: SearchForUniversityUseCaseContract {
    func search(for university: String) -> AnyPublisher<[UniversitiesResponse], Error> {
        return repository
            .search(for: university)
    }
}
