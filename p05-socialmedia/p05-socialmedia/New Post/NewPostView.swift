//
//  NewPostView.swift
//  p05-socialmedia
//
//  Created by peter wi on 2/22/22.
//

import SwiftUI

struct NewPostView: View {
    @StateObject private var vm = NewPostViewModel()
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>

    let name: String
    let username: String
    let imageAddress: String
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .top) {
                VStack {
                    Image(imageAddress)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Spacer()
                }
                TextEditor(text: $vm.currentPostText)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    vm.makePost(name: name, username: username, imgAddress: imageAddress)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Tweet")
                }
            }
        }
        .navigationTitle("Create Post")
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(name: "Sam", username: "Samie", imageAddress: "sam")
    }
}
