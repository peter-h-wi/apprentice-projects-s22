//
//  ContentView.swift
//  p03-flag-refactor
//
//  Created by peter wi on 1/21/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = GameViewModel()
    
    var body: some View {
        GameView(vm: vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
