//
//  MoodTrackerView.swift
//  p04-mood-tracker
//
//  Created by peter wi on 1/22/22.
//

import SwiftUI

struct MoodTrackerView: View {
    @StateObject var vm: MoodTrackerViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                Group {
                    Text("Moodiary")
                        .font(Font.system(.largeTitle, design: .default).weight(.semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        .padding(.leading)
                    Divider()
                        .padding(.top, 11)
                    HStack {
                        VStack {
                            ColorPicker("Mood Color!", selection: $vm.myColor)
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(vm.myColor)
                        .cornerRadius(10)
                        .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue:0/255).opacity(0.25), radius: 8, x: 0, y: 4)
                        .padding(.horizontal)
                        VStack(alignment: .leading) {
                            Text("Your Feeling?")
                                .foregroundColor(Color.secondary)
                                .font(.headline )
                            TextField("Happy!", text: $vm.myMood)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .font(.body)
                            Spacer()
                            Text("How much?")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Picker("Strength of Mood", selection: $vm.selectedStrength) {
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
                        withAnimation(.spring()) {
                            vm.addMood()
                        }
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
                            let grad = AngularGradient(
                                gradient: Gradient(colors: [mood.color, .white]),
                                center: .center,
                                angle: .degrees(0))
                                
                            Circle()
                                .fill(grad)
                                .frame(width: 80, height: 80)
                                .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue:0/255).opacity(0.25), radius: 4, x: 0, y: 2)
                                
                            VStack(alignment: .leading, spacing: 0) {
                                Spacer()
                                    .frame(height: 5)
                                    .clipped()
                                Text("Feeling " + mood.mood.lowercased() + "!")
                                    .font(Font.system(.headline, design: .default).weight(.medium))
                                Text("How much? \(mood.strength) out of 5!")
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
                    Button(action: {
                        withAnimation(.spring()) {
                            vm.isShort.toggle()
                        }
                    }) {
                        let msg = vm.isShort ? "Load more" : "Show less"
                        Text(msg)
                            .font(Font.system(.subheadline, design: .default))
                            .foregroundColor(.cyan)
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
