//
//  MilesRanViewModel.swift
//  p07-runny
//
//  Created by peter wi on 3/8/22.
//

import Foundation

final class MilesRanViewModel: ObservableObject {
    @Published private(set) var milesRan: Double = 0.0
    @Published private(set) var isZeroMile: Bool = true
    
    init() {
        milesRan = MilesRanStore.fetchMiles()
    }
    
    func increment(amount: Double) {
        milesRan += amount
        isZeroMile = milesRan < 0
        MilesRanStore.save(miles: milesRan)
    }
    
    func decrement(amount: Double) {
        milesRan = milesRan<amount ? 0 : milesRan-amount
        isZeroMile = milesRan < 0
        MilesRanStore.save(miles: milesRan)
    }
    
}
