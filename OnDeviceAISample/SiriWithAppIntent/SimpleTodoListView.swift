//
//  SimpleTodoListView.swift
//  OnDeviceAISample
//
//  Created by nhn on 1/14/25.
//

import SwiftUI
import AppIntents

struct TodoItemsSnippetView: View, ShowsSnippetView {
    var value: [TodoItem]?

    var body: some View {
        ForEach(value ?? []) { item in
            HStack(spacing: 8) {
                Button(action: { }) {
                    Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(item.isCompleted ? .green : .red)
                }
                .disabled(true)
                Text(item.title)
                Text(item.category.rawValue)
                Spacer()
            }
            .padding(.bottom, 4)
        }
        .padding([.leading, .top], 8)
    }
}
