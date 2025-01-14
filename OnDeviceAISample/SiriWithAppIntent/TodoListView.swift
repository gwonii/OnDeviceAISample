//
//  TodoListView.swift
//  OnDeviceAISample
//
//  Created by nhn on 1/14/25.
//

import SwiftUI

import SwiftUI

struct TodoListView: View {
    private var viewModel = TodoListViewModel.shared
    @State private var newTitle: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                HStack {

                    TextField("새 할 일을 입력하세요", text: $newTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: {
                        guard !newTitle.isEmpty else { return }

                        viewModel.addTodoItem(title: newTitle)
                        newTitle = ""
                    }) {
                        Text("추가")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.trailing)
                }

                List {
                    ForEach(viewModel.todoItems) { item in
                        HStack {
                            Button(action: {
                                viewModel.toggleTodoItemCompletion(item)
                            }) {
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .red)
                            }
                            .padding(.leading, 8)
                            .padding(.trailing, 24)

                            HStack {
                                HStack(spacing: 8) {
                                    Text(item.title)
                                        .font(Font.title2)
                                        .foregroundColor(item.isCompleted ? .gray : .black)
                                    Text(item.createdAt_yyyyMMdd)
                                        .foregroundColor(item.isCompleted ? .gray : .black)
                                }

                                Text(item.category.rawValue)
                                    .foregroundColor({
                                        switch item.category {
                                            case .work: return Color.blue
                                            case .personal: return Color.green
                                            case .none: return Color.orange
                                        }
                                    }())
                                    .padding(.horizontal, 12)
                            }
                            .strikethrough(item.isCompleted)

                            Spacer()
                        }
                    }
                    .onDelete(perform: viewModel.deleteTodoItem)
                }
            }
            .navigationTitle("Siri with AppIntent ✅")
        }
    }
}

#Preview {
    TodoListView()
}
