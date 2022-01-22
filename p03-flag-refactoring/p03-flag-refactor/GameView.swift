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
    let game: GameViewModel
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Tap the flag of")
                    
                Text(game.getCountry().name)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    
                Text("Score: \(game.getScore())")

                Spacer()
                    
                ForEach(game.getCountries(), id: \.id) { country in
                    Button(action: {
                        if country == game.getCountry() {
                            alertTitle = "Correct"
                            game.correctAnswer()
                        } else {
                            alertTitle = "Wrong! Thats the flag of \(country.name)"
                        }
                        
                        showingAlert = true
                    }) {
                        FlagImage(imageName: country.name)
                    }
                }
                    
                Spacer()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle),
                      message: Text("Your Score is \(game.getScore())"),
                      dismissButton: .default(Text("Continue")) {
                    game.newGame()
                })
            }
        }
        .preferredColorScheme(.dark)
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
