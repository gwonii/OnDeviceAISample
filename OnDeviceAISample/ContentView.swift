//
//  ContentView.swift
//  OnDeviceAISample
//
//  Created by nhn on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            WritingToolsView()
                .tabItem {
                    Text("WT ✏️")
                }
                .tag(0)

            TodoListView()
                .tabItem {
                    Text("SWAI ✅")
                }
                .tag(1)
        }
        .tabViewStyle(.automatic)
    }
}
