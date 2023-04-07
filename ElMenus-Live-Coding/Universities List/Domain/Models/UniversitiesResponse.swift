//
//  UniversitiesResponse.swift
//  ElMenus-Live-Coding
//
//  Created by Ramy Sabry on 03/07/2022.
//

import Foundation

struct UniversitiesResponse: Decodable, Hashable {
    let domains: [String]?
    let webPages: [String]?
    let stateProvince: String?
    let name: String?
    let country: String?

    enum CodingKeys: String, CodingKey {
        case domains
        case webPages = "web_pages"
        case stateProvince = "state-province"
        case name, country
    }
}
