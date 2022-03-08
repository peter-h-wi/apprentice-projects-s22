//
//  ContentView.swift
//  p06-widgetkit-intro
//
//  Created by peter wi on 3/6/22.
//

import SwiftUI

struct ContentView: View {
    @State var todos: [Todo] = []
    @State var selectedTodo: Todo?
    
    var body: some View {
        NavigationView {
            List(todos) { todo in
                Button {
                    selectedTodo = todo
                } label: {
                    Text("\(todo.title): **\(todo.completed ? "completed" : "open")**")
                }
                .buttonStyle(.plain)
            }
            .navigationTitle("My Todos")
            .task {
                do {
                    todos = try await TodoService.shared.getAllTodos()
                } catch {
                    print(error)
                }
            }
            .sheet(item: $selectedTodo) { todo in
                GroupBox {
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .font(.headline)
                        Text(todo.completed ? "Completed" : "Open")
                            .font(.subheadline)
                    }
                } label: {
                    Label("Todo #\(todo.id)", systemImage: "person")
                }
                .padding()
            }
            // this happens when we open it through our widget
            .onOpenURL { url in
                guard
                    // scheme is "myapp" from "myapp://todo/1", or https from https://
                    // host is "todo" from it.
                    // id is "1" from it.
                    url.scheme == "myapp",
                    url.host == "todo",
                    let id = Int(url.pathComponents[1])
                else {
                    print("issue")
                    return
                }
                
                Task {
                    do {
                        let todo = try await TodoService.shared.getTodo(with: id)
                        // when await is finished, switch back to queue
                        DispatchQueue.main.async {
                            selectedTodo = todo
                        }
                    } catch {
                        // hanlde error in an adequate way
                        print(error)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
