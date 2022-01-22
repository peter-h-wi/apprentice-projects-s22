//
//  Countries.swift
//  p03-flag-refactor
//
//  Created by Samuel Shi on 1/17/22.
//  Redeveloped by Peter Wi on 1/21/22.
//

import Foundation

struct Country: Identifiable, Equatable {
    let id = UUID()
    let name: String
}

enum CountryList {
    static let countries = [
        Country(name: "Estonia"),
        Country(name: "France"),
        Country(name: "Germany"),
        Country(name: "Ireland"),
        Country(name: "Italy"),
        Country(name: "Nigeria"),
        Country(name: "Poland"),
        Country(name: "Russia"),
        Country(name: "Spain"),
        Country(name: "UK"),
        Country(name: "US"),
    ]
}
