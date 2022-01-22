//
//  GameViewModel.swift
//  p03-flag-refactor
//
//  Created by Samuel Shi on 1/17/22.
//  Redeveloped by Peter Wi on 1/21/22.
//

import Foundation

final class GameViewModel: ObservableObject {
    
    @Published var countries = CountryList.countries.shuffled().prefix(3)
    @Published var correctAnswerIndex = Int.random(in: 0...2)
    @Published var score = 0
    
    func getCountries() -> ArraySlice<Country> {
        return countries
    }
    
    func getCountry() -> Country {
        return countries[correctAnswerIndex]
    }
    
    func getScore() -> Int {
        return score
    }
    
    func correctAnswer() {
        score += 1
    }
    
    func newGame() {
        countries = CountryList.countries.shuffled().prefix(3)
        correctAnswerIndex = Int.random(in: 0...2)
    }
    
    func resetScore() {
        score = 0
    }
}
