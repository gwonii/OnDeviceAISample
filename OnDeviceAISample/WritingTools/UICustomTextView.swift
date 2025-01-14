//
//  UICustomTextView.swift
//  OnDeviceAISample
//
//  Created by nhn on 1/14/25.
//

import UIKit
import SwiftUI

struct UICustomTextView: UIViewRepresentable {
    @Binding var text: String
    let onStartTimer: () -> Void
    let onStopTimer: () -> Void

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.text = text
        textView.isEditable = true
        textView.writingToolsBehavior = .complete
        textView.font = UIFont.systemFont(ofSize: 17, weight: .regular)

        textView.delegate = context.coordinator

        return textView
    }

    func updateUIView(_ textView: UITextView, context: Context) {
        if textView.text != text {
            textView.text = text
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: UICustomTextView

        init(parent: UICustomTextView) {
            self.parent = parent
        }

        func textViewWritingToolsWillBegin(_ textView: UITextView) {
            parent.onStartTimer()
        }

        func textViewWritingToolsDidEnd(_ textView: UITextView) {
            parent.onStopTimer()
        }

        func textViewDidChange(_ textView: UITextView) {
            guard parent.text != textView.text else { return }

            parent.text = textView.text
        }
    }
}

