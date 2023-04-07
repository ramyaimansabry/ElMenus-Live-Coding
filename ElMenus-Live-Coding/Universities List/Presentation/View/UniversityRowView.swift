//
//  UniversityRowView.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import SwiftUI

struct UniversityRowView: View {
    let name: String
    
    var body: some View {
        HStack {
            Text(name)
        }
    }
}

struct UniversityRowView_Previews: PreviewProvider {
    static var previews: some View {
        UniversityRowView(name: "Ramy")
    }
}
