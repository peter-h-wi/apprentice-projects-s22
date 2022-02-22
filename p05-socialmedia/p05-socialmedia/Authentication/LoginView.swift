//
//  LoginView.swift
//  p05-socialmedia
//
//  Created by peter wi on 2/22/22.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    LoginTopView(height: geo.size.height*0.5, width: geo.size.width*0.5)
                    LoginInputView(username: $username, password: $password)
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Spacer()
                            Text("Log In")
                                .bold()
                            Spacer()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!isValidInput)
                }
                .padding()
            }
        }
    }
    
    var isValidInput: Bool {
        if (username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            return false
        }
        return true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .bothColorSchemes()
    }
}

struct LoginTopView: View {
    let height: Double
    let width: Double
    var body: some View {
        VStack {
            Text("bluebird")
                .font(.system(.largeTitle, design: .serif))
                .italic()
                .bold()
                .foregroundColor(.blue)
                .frame(width: min(width, height), height:  min(width, height))
                .background(Circle().fill(.primary))
            Text("Log in to bluebird")
                .font(.largeTitle)
                .bold()
        }
    }
}

struct LoginInputView: View {
    @Binding var username: String
    @Binding var password: String
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .foregroundColor(.primary)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                .foregroundColor(.primary)
                .textFieldStyle(.roundedBorder)
        }
    }
}
