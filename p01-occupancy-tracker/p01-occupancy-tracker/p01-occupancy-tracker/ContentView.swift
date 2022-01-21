//
//  ContentView.swift
//  p01-occupancy-tracker
//
//  Created by peter wi on 1/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var maximum = 20
    @State private var isShowingAlert = false
    @State private var statusGradient = Gradient(stops: [.init(color: .green, location: 0), .init(color: .green, location: 1)])
    @State private var statusMsg = "SAFE"
    @State private var statusColor = Color.green
    
    fileprivate func updateGradient() {
        if (count>maximum) {
            statusGradient = Gradient(stops: [.init(color: .red, location: 0), .init(color: .red, location: 1)])
        } else if (100*count/maximum>=80) {
            // range: max * 0.8 to max * 1.0
            statusGradient = Gradient(stops: [
                .init(color: .yellow, location: 0),
                .init(color: .yellow, location: 1-(Double(count+1)-Double(maximum)*0.8)/(Double(maximum)*0.2)),
                .init(color: .red, location: 1-(Double(count)-Double(maximum)*0.8)/(Double(maximum)*0.2)),
                .init(color: .red, location: 1)])
        } else {
            // range: max * 0 to max * 0.8
            statusGradient = Gradient(stops: [
                .init(color: .green, location: 0),
                .init(color: .green, location: 1-Double(count+1)/(Double(maximum)*0.8)),
                .init(color: .yellow, location: 1-Double(count)/(Double(maximum)*0.8)),
                .init(color: .yellow, location: 1)])
        }
    }
    
    fileprivate func updateStatusMsg() {
        if (count > maximum) {
            statusMsg = "DANGEROUS"
            statusColor = Color.red
        } else if (count * 100 / maximum >= 80) {
            statusMsg = "WARNING"
            statusColor = Color.yellow
        } else {
            statusMsg = "SAFE"
            statusColor = Color.green
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: statusGradient, startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Button(action: {
                            count = 0
                            updateStatusMsg()
                            updateGradient()
                        }) {
                            Image(systemName: "arrow.counterclockwise.circle")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                            
                        Spacer()
                        NavigationLink(destination: SettingsView(maximum: $maximum)) {
                            Image(systemName: "gear")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    Spacer()
                    
                    Text(statusMsg)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundColor(statusColor)
                        .background(Color.white)
                        .cornerRadius(40)
                        .foregroundColor(statusColor)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.white, lineWidth: 5)
                        )
                    
                    Text("\(count) People")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                    
                    Text("Out of \(maximum) People")
                        .font(.body)
                        .foregroundColor(.white)
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            if (count == 0) {
                                isShowingAlert = true
                            } else {
                                count -= 1
                            }
                            updateStatusMsg()
                            updateGradient()
                        }) {
                            if (count == 0) {
                                Image(systemName: "nosign")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            } else {
                                Image(systemName: "minus.circle")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                            
                        }
                        .alert("Minus button is disabled!", isPresented: $isShowingAlert) {
                            Button("Dismiss", role: .cancel, action: {})
                        }
                        Spacer()
                        Button(action: {
                            count += 1
                            updateStatusMsg()
                            updateGradient()
                        }) {
                            Image(systemName: "plus.circle")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                            
                    }
                    .padding()
                }
                .padding()
                .navigationBarHidden(true)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
