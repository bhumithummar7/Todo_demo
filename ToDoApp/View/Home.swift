//
//  Home.swift
//  ToDoApp
//
//  Created by Bhumi Thummar on 08/05/25.
//

import SwiftUI
import SwiftData
struct Home: View {
    /// Active Todo's
    @Query(filter: #Predicate<Todo> { !$0.isCompleted }, sort:
            [SortDescriptor (\Todo.lastUpdated, order: .reverse)], animation: .snappy)
    private var activeList: [Todo]
    @Environment(\.modelContext) private var context
    @State private var showAll: Bool = false
    var body: some View {
        List {
            Section (activeSectionTitle) {
                ForEach(activeList){
                    TodoRowView(todo: $0)
                }
            }
            
            /// completed List
            CompletedTodoList(showAll: $showAll)
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    let todo = Todo(task: "", priority: .normal)
                    context.insert(todo)
                }, label: {
                    Image (systemName: "plus.circle.fill")
                        .fontWeight(.light)
                        .font(.system (size: 42))
                })
            }
        }
    }
    var activeSectionTitle: String {
        let count = activeList.count
        return count == 0 ? "Active" : "Active (\(count))"
    }
}
#Preview {
    ContentView()
}
