//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Samuel Shi on 1/17/22.
//  Redeveloped by Peter Wi on 1/21/22.
//  Copyright © 2022 samrshi. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var image: String
    var body: some View {
        Image(image)
            .renderingMode(.original)
        // clipShape: rectangle, rounded rectangle, circle, and capsule
            .clipShape(Capsule())
        // overlay: drawing a border around the image -> a capture has a black stroke around its edge
            .overlay(Capsule().stroke(Color.white, lineWidth: 2))
            .shadow(color: .black, radius: 2)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(image: "Estonia")
    }
}
