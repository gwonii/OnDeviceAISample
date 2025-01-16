//
//  AddTodoItemIntent.swift
//  OnDeviceAISample
//
//  Created by nhn on 1/14/25.
//

import Foundation
import AppIntents
import SwiftUI

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

    @MainActor
    func perform() throws -> some IntentResult {
        TodoListViewModel.shared.toggleTodoItemCompletion(todoItem)
        return .result()
    }
}

struct FindTodoListIntent: AppIntent {
    static let title: LocalizedStringResource = "Find Todo List"

    @Parameter(title: "Find todo itess by keyword")
    var keyword: String

    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        let allTodoItems = TodoListViewModel.shared.todoItems
        let targetTodoItems = allTodoItems.filter({ $0.title.contains(keyword) })

        let todoItems = targetTodoItems.isEmpty ? allTodoItems : targetTodoItems
        return .result(
            dialog: IntentDialog("검색 결과"),
            view: TodoItemsSnippetView(value: todoItems)
        )
    }
}
