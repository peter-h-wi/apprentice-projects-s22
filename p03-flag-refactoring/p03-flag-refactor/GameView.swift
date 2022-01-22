//
//  GameView.swift
//  GuessTheFlag
//
//  Created by hawkeyeshi on 6/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//  Redeveloped by Peter Wi on 1/21/22.
//

import SwiftUI

struct GameView: View {
    @StateObject var vm: GameViewModel

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .font(.title)
                        .foregroundColor(.white)
                    Text(vm.getCountry().name)
                        .foregroundColor(.white)
                    // .largeTitle is the largest built-in font size - absed on user setting for their font size
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text("Score: \(vm.getScore())")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
                ForEach(vm.getCountries(), id: \.id) { country in
                    Button(action: {
                        withAnimation {
                            if (country == vm.getCountry()) {
                                vm.correct()
                            } else {
                                vm.wrong()
                            }
                            vm.isClicked.toggle()
                            vm.showingScore = true
                        }
                    }) {
                        FlagImage(image: country.name)
                            .rotation3DEffect(.degrees(country == vm.getCountry() ? vm.animationAmount : 0), axis: (x:0, y:1, z:0))
                            .opacity(vm.isClicked ? (country == vm.getCountry() ? 1 : 0.25) : 1)
                            .scaleEffect(vm.isClicked ? (country == vm.getCountry() ? 1 : 0.8) : 1)
                    }
                }
            }
            .alert(isPresented: $vm.showingScore) {
                var msg: Text
                msg = Text("Your score is \(vm.getScore())")
                
                return Alert(title: Text(vm.scoreTitle), message: msg, dismissButton: .default(Text("Continue")) {
                    vm.newGame()
                })
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
