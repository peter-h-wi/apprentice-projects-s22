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
    var imageName: String

    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .padding(10)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(imageName: "Estonia")
    }
}
