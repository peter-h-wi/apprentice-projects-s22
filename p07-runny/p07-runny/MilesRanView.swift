//
//  MilesRanView.swift
//  p07-runny
//
//  Created by peter wi on 3/8/22.
//

import SwiftUI

struct MilesRanView: View {
    @StateObject private var vm = MilesRanViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.milesRan, specifier: "%.2f")")
                .font(.system(size: 130))
            Text("MILES")
                .font(.headline)
                .foregroundColor(.secondary)
            HStack {
                Button(action: {
                    vm.decrement(amount: 0.5)
                }) {
                    Image(systemName: "minus.circle")
                        .font(.largeTitle)
                }
                .disabled(vm.isZeroMile)
                
                Spacer()
                Button(action: {
                    vm.increment(amount: 0.5)
                }) {
                    Image(systemName: "plus.circle")
                        .font(.largeTitle)
                }
            }
            .padding()
            .padding()
            .padding()
            .padding()
        }
    }
}

struct MilesRanView_Previews: PreviewProvider {
    static var previews: some View {
        MilesRanView()
    }
}
