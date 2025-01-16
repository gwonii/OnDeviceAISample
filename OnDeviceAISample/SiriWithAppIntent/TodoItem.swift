//
//  TodoItem.swift
//  OnDeviceAISample
//
//  Created by nhn on 1/14/25.
//

import Foundation
import AppIntents

struct TodoItem: Identifiable, Codable, Sendable {
    enum Category: String, Codable, CaseIterable {
        case none
        case work
        case personal
    }

    var id = UUID()
    var title: String
    var createdAt: Date = Date()
    var category: Category = Category.allCases.randomElement()!
    var isCompleted: Bool = false
    var isFiltered: Bool = false

    var createdAt_yyyyMMdd: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: createdAt)
    }
}
