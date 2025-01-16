//
//  TodoShortcutProvider.swift
//  OnDeviceAISample
//
//  Created by nhn on 1/14/25.
//

import Foundation
import SwiftUI
import AppIntents

struct MovieAppShortcutProvider: AppShortcutsProvider {
    @State var isVisible: Bool = true

    @AppShortcutsBuilder
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: AddTodoItemIntent(),
            phrases: [
                "Add Todo \(.applicationName)"
            ],
            shortTitle: "Add Todo",
            systemImageName: "popcorn.circle"
        )

        AppShortcut(
            intent: FinishTodoItemIntent(),
            phrases: [
                "Finish Todo \(.applicationName)"
            ],
            shortTitle: "Finish Todo",
            systemImageName: "star.circle"
        )

        AppShortcut(
            intent: FindTodoListIntent(),
            phrases: [
                "Find todo by \(.applicationName)",
                "Find \(\.$keyword) In \(.applicationName) app",
                "In \(.applicationName) app, Todo Item from \(\.$keyword)"
            ],
            shortTitle: "Find gonii Todo",
            systemImageName: "trash.circle"
        )

//        AppShortcut(
//            intent: FindTodoListIntent(),
//            phrases: [
//                "In \(.applicationName) app, Todo Item from \(\.$keyword)"
//            ],
//            shortTitle: "Find gonii Todo3",
//            systemImageName: "trash.circle"
//        )
    }
}
