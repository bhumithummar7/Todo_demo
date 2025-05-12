//
//  ContentView.swift
//  ToDoApp
//
//  Created by Bhumi Thummar on 08/05/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        NavigationStack{
            Home()
                .navigationTitle("Todo List")
        }
    }
}


#Preview {
    ContentView()
}
