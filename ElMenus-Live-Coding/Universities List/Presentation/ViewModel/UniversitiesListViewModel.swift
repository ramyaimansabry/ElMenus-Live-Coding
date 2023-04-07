//
//  UniversitiesListViewModel.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import Foundation
import Combine

class UniversitiesListViewModel: BaseViewModel, ObservableObject {
    private let searchForUniUseCase: SearchForUniversityUseCaseContract
    
    // MARK: - Output Properties
    @Published var universities: [UniversitiesResponse] = []
    
    // MARK: - Input Properties
    @Published var searchInput: String = ""
    
    init(searchForUniUseCase: SearchForUniversityUseCaseContract = SearchForUniversityUseCase()) {
        self.searchForUniUseCase = searchForUniUseCase
        super.init()
        
        self.subscribeOnSearchInputChange()
    }
}

private extension UniversitiesListViewModel {
    func subscribeOnSearchInputChange() {
        $searchInput
            .debounce(for: .seconds(0.7), scheduler: DispatchQueue.main)
            .sink { [weak self] value in
                self?.search(for: value)
            }
            .store(in: &cancellables)
    }
    
    func search(for university: String) {
        state = .loading
        
        searchForUniUseCase
            .search(for: university)
            .receive(on: RunLoop.main)
            .sink { completion in
                if case .failure = completion {
                    // handle representing error
                }
                
            } receiveValue: { response in
                self.universities = response
            }
            .store(in: &cancellables)
        
    }
}
