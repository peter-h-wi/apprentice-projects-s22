//
//  MoodTrackerView.swift
//  p04-mood-tracker
//
//  Created by peter wi on 1/22/22.
//

import SwiftUI

struct MoodTrackerView: View {
    @StateObject var vm: MoodTrackerViewModel
    
    @State private var selectedStrength = 1
    @State private var myMood = ""
    @State private var myColor = Color.blue
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                Group {
                    Text("idoom")
                        .font(Font.system(.largeTitle, design: .default).weight(.semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        .padding(.leading)
                    Divider()
                        .padding(.top, 11)
                    HStack {
                        VStack {
                            ColorPicker("Mood Color", selection: $myColor)
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(myColor)
                        .cornerRadius(10)
                        .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue:0/255).opacity(0.25), radius: 8, x: 0, y: 4)
                        .padding(.horizontal)
                        VStack(alignment: .leading) {
                            Text("My Mood")
                                .foregroundColor(Color.secondary)
                                .font(.headline )
                            TextField("Happy", text: $myMood)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .font(.body)
                            Spacer()
                            Text("Strength")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Picker("Strength of Mood", selection: $selectedStrength) {
                                ForEach(1..<6) {
                                    Text("\($0)")
                                }
                            }.pickerStyle(SegmentedPickerStyle())
                        }
                        .frame(maxHeight: .infinity)
                        .clipped()
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                    Button(action: {
                        var result = vm.addMood(curMood: myMood, curStrength: selectedStrength, curColor: myColor)
                        myMood = ""
                    }) {
                        Text("Save")
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 35)
                            .clipped()
                            .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(Color.cyan)
                                            .padding(.horizontal), alignment: .center)
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    Divider()
                        .padding(.top, 11)
                    
                    ForEach(vm.getMoods().reversed(), id: \.id) { mood in
                        HStack(spacing: 14) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 90, height: 90)
                                .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue:0/255).opacity(0.25), radius: 4, x: 0, y: 2)
                                .foregroundColor(mood.color)
                                
                            VStack(alignment: .leading, spacing: 0) {
                                Spacer()
                                    .frame(height: 5)
                                    .clipped()
                                Text(mood.mood)
                                    .font(Font.system(.headline, design: .default).weight(.medium))
                                Text("\(mood.strength)/5")
                                    .font(Font.system(.subheadline, design: .default).weight(.regular))
                                    .foregroundColor(.secondary)
                                Text(mood.formattedTimestamp)
                                    .font(.footnote)
                                    .padding(.top, 8)
                                    .foregroundColor(Color(.tertiaryLabel))
                            }
                            Spacer()
                        }
                        .padding()
                        Divider()
                    }
                }
                Group {
                    Button(action: {}) {
                        Text("Load more")
                            .font(Font.system(.subheadline, design: .default))
                            .padding()
                    }
                    
                    Divider()
                    Spacer()
                        .frame(height: 40)
                        .clipped()
                }
            }
            .frame(maxWidth: .infinity)
            .clipped()
            .padding(.top, 10)
        }
    }
}

struct MoodTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        MoodTrackerView(vm: MoodTrackerViewModel())
    }
}
