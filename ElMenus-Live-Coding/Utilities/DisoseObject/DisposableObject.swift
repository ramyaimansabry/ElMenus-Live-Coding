//
//  DisposableObject.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import Combine

class DisposableObject {
    var cancellables: Set<AnyCancellable>
    
    init() {
        cancellables = Set<AnyCancellable>()
    }
    
    deinit {
        cancellables.removeAll()
    }
}
