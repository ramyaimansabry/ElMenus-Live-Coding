//
//  UniversitiesRepositoryContract.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import Combine

protocol UniversitiesRepositoryContract {
    func search(for university: String) -> AnyPublisher<[UniversitiesResponse], Error>
}
