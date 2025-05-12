//
//  TodoListBundle.swift
//  TodoList
//
//  Created by Bhumi Thummar on 08/05/25.
//

import WidgetKit
import SwiftUI

@main
struct TodoListBundle: WidgetBundle {
    var body: some Widget {
        TodoList()
        TodoListControl()
        TodoListLiveActivity()
    }
}
