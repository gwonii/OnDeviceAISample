//
//  TodoListViewModel.swift
//  OnDeviceAISample
//
//  Created by nhn on 1/14/25.
//

import Foundation

@Observable
class TodoListViewModel: ObservableObject {
    static let shared: TodoListViewModel = TodoListViewModel()

    var todoItems: [TodoItem] = [
        TodoItem(title: "일기쓰기"),
        TodoItem(title: "운동하기"),
        TodoItem(title: "빨래하기")
    ]

    func addTodoItem(title: String) {
        let newTodo = TodoItem(title: title)
        todoItems.append(newTodo)
    }

    func deleteTodoItem(atOffsets offsets: IndexSet) {
        todoItems.remove(atOffsets: offsets)
    }

    func toggleTodoItemCompletion(_ item: TodoItem) {
        todoItems = todoItems
            .map {
                guard $0.id == item.id else { return $0 }

                return TodoItem(id: $0.id, title: $0.title, isCompleted: !$0.isCompleted)
            }
    }
}
