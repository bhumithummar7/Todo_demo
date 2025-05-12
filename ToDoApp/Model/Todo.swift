//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by Bhumi Thummar on 08/05/25.
//

import SwiftUI
import SwiftData
@Model
class Todo {
    var taskID: String = UUID().uuidString
    var task: String
    var isCompleted: Bool = false
    var priority: Priority = Priority.normal
    var lastUpdated: Date = Date.now
    init(task: String, priority: Priority) {
        self.task = task
        self.priority = priority
    }
}
/// Priority Status
enum Priority: String, Codable, CaseIterable {
    case normal = "Normal"
    case medium = "Medium"
    case high = "High"
    /// Priority Color
    var color: Color {
        switch self {
            case .normal:
                return .green
            case .medium:
                return .yellow
            case .high:
                return .red
        }
    }
}

