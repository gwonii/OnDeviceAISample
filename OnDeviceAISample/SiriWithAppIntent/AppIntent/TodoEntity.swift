//
//  TodoEntity.swift
//  OnDeviceAISample
//
//  Created by nhn on 1/14/25.
//

import Foundation
import AppIntents

extension TodoItem: AppEntity {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Todo"

    var displayRepresentation: DisplayRepresentation {
        return DisplayRepresentation(title: LocalizedStringResource(stringLiteral: title))
    }

    static var defaultQuery = TodoQuery()
}

struct TodoQuery: EntityQuery {
    func entities(for identifiers: [UUID]) async throws -> [TodoItem] {
        TodoListViewModel.shared.todoItems.filter { identifiers.contains($0.id) }
    }

    func suggestedEntities() async throws -> [TodoItem] {
        TodoListViewModel.shared.todoItems.filter { $0.isCompleted == false }
    }
}
