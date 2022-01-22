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
    @Published var correctAnswer = Int.random(in: 0...2)
    @Published var score : Int = 0
    
    @Published var showingScore = false
    @Published var scoreTitle = ""
    @Published var isClicked = false
    
    @Published var animationAmount = 0.0
    
    
    
    func getCountries() -> ArraySlice<Country> {
        return countries
    }
    
    func getCountry() -> Country {
        return countries[correctAnswer]
    }
    
    func getScore() -> Int {
        return score
    }
    
    func correct() {
        score += 1
        scoreTitle = "Correct"
        animationAmount += 360
    }
    
    func wrong() {
        score = score>0 ? score-1 : 0
        scoreTitle = "Wrong"
        animationAmount += 360
    }
    
    func newGame() {
        countries = CountryList.countries.shuffled().prefix(3)
        correctAnswer = Int.random(in: 0...2)
        isClicked = false
        animationAmount = 0
    }
    
    func resetScore() {
        score = 0
    }
}
