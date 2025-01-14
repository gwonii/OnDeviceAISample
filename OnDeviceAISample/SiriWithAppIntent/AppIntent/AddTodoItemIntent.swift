//
//  AddTodoItemIntent.swift
//  OnDeviceAISample
//
//  Created by nhn on 1/14/25.
//

import Foundation
import AppIntents

struct AddTodoItemIntent: AppIntent {
    static var title: LocalizedStringResource = LocalizedStringResource("Add Todo Item")

    @Parameter(title: "Todo Title")
    var todoTitle: String

    func perform() throws -> some IntentResult {
        TodoListViewModel.shared.addTodoItem(title: todoTitle)
        return .result()
    }
}

struct FinishTodoItemIntent: AppIntent {
    static var title: LocalizedStringResource = LocalizedStringResource("Finish Todo Item")

    @Parameter(title: "Finish Todo Item")
    var todoItem: TodoItem

    func perform() throws -> some IntentResult {
        TodoListViewModel.shared.toggleTodoItemCompletion(todoItem)
        return .result()
    }
}
