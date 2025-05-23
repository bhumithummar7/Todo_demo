//
//  CompletedList.swift
//  ToDoApp
//
//  Created by Bhumi Thummar on 08/05/25.
//

import SwiftUI
import SwiftData
struct CompletedTodoList: View {
    @Binding var showAll: Bool
    @Query private var completedList: [Todo]
    init(showAll: Binding<Bool>) {
        let predicate = #Predicate<Todo> { $0.isCompleted }
        let sort = [SortDescriptor (\Todo.lastUpdated, order: .reverse)]
        var descriptor = FetchDescriptor (predicate: predicate, sortBy: sort)
        if !showAll.wrappedValue {
            /// Limiting to 15
            descriptor.fetchLimit = 15
        }
        _completedList = Query(descriptor, animation: .snappy)
        _showAll = showAll
    }
    var body: some View {
        Section {
            ForEach(completedList){
                TodoRowView(todo: $0)
            }
        } header: {
            HStack {
                Text("Completed")
                Spacer (minLength: 0)
                if showAll && !completedList.isEmpty{
                    Button("Show Recents") {
                        showAll = false
                    }
                }
            }
            .font(.caption)
        } footer: {
            if completedList.count == 15 && !showAll && !completedList.isEmpty{
                HStack {
                    Text("Showing Recent 15 Tasks")
                        .foregroundStyle(.gray)
                    Button("Show All") {
                        showAll = true
                    }
                }
                .font(.caption)
            }
        }
    }
}

#Preview {
    ContentView()
}
