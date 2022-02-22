//
//  SignUpView.swift
//  p05-socialmedia
//
//  Created by peter wi on 2/22/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var password_confirm: String = ""
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    SignUpTopView(width: geo.size.width*0.5, height: geo.size.height*0.5)
                    
                    SignUpInputView(username: $username, name: $name, password: $password, password_confirm: $password_confirm)
                        .padding(.vertical)

                    if (!password.elementsEqual(password_confirm) && !password_confirm.isEmpty) {
                        Text("Passwords must be same")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                    Button {
                        
                    } label: {
                        HStack {
                            Spacer()
                            Text("Sign Up")
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
        if (username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || password_confirm.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || !password.elementsEqual(password_confirm)
        ) {
            return false
        }
        return true
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

struct SignUpTopView: View {
    let width: Double
    let height: Double
    
    var body: some View {
        VStack {
            Text("bluebird")
                .font(.system(.largeTitle, design: .serif))
                .italic()
                .bold()
                .foregroundColor(.blue)
                .frame(width: min(width, height), height: min(width, height))
                .background(Circle().fill(.primary))
            Text("Join bluebird today")
                .font(.largeTitle)
                .bold()
        }
        
    }
}

struct SignUpInputView: View {
    @Binding var username: String
    @Binding var name: String
    @Binding var password: String
    @Binding var password_confirm: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Username")
                .font(.headline)
            TextField("id", text: $username)
                .foregroundColor(.primary)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
            Text("Name")
                .font(.headline)
            TextField("Name", text: $name)
                .foregroundColor(.primary)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
            Text("Password")
                .font(.headline)
            SecureField("Password", text: $password)
                .foregroundColor(.primary)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
            Text("Confirm Password")
                .font(.headline)
            SecureField("Confirm Password", text: $password_confirm)
                .foregroundColor(.primary)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
        }
    }
}
