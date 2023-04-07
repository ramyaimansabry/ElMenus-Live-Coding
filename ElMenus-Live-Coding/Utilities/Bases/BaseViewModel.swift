//
//  BaseViewModel.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import Combine

class BaseViewModel: DisposableObject {
    @Published var state: ViewModelState = .idle
}
