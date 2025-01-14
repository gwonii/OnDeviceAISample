//
//  WritingToolsView.swift
//  OnDeviceAISample
//
//  Created by nhn on 1/14/25.
//

import SwiftUI

import SwiftUI

struct WritingToolsView: View {
    @State var textContent: String = """
      Artificial intelligence (AI) is a collection of technologies that allow computers to perform tasks that are typically done by humans. AI systems can learn from experience, analyze data, and make decisions. 
      """

    @State var elapsedTime: TimeInterval = 0
    @State var timer: Timer? = nil

    var body: some View {
        NavigationStack {
            Form {
                UICustomTextView(
                    text: $textContent,
                    onStartTimer: startTimer,
                    onStopTimer: stopTimer
                )
                .frame(height: 600)

                HStack() {
                    Spacer()
                    Text("Elapsed Time: \(String(format: "%.2f", elapsedTime)) seconds")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 24)
                    Spacer()
                }
            }
            .navigationTitle("Writing Tools ✏️")
        }

    }

    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            elapsedTime += 0.01
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    WritingToolsView()
}

