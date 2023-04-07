//
//  ContentView.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UniversitiesListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.universities, id: \.self) { uni in
                    UniversityRowView(name: uni.name ?? "")
                }
            }
            .searchable(text: $viewModel.searchInput)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
