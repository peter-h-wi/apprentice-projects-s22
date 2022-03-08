//
//  LargeSizeView.swift
//  WidgetKitCourseExtension
//
//  Created by peter wi on 3/7/22.
//

import WidgetKit
import SwiftUI

struct LargeSizeView: View {
    var entry: SimpleEntry
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Text("My Todos")
                
                Text(Date.now, format: .dateTime)
                
                Spacer()
            }
            .padding(8)
            .background(.blue)
            .foregroundColor(.white)
            // clipped: it handles as a single view
            .clipped()
            // if there is no clipped: .shadow will be applied to every subviews in HStack
            .shadow(radius: 5)
            
            ForEach(entry.todos, id: \.id) { todo in
                Link(destination: URL(string: "myapp://todo/\(todo.id)")!) {
                    HStack {
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: 30, height: 30)
                            .overlay {
                                if todo.completed {
                                    Image(systemName: "checkmark")
                                }
                            }
                        
                        Text(todo.title)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                
                Divider()
            }
            Spacer()  
        }
    }
}

