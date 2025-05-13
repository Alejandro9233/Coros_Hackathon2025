//
//  QuestionCard.swift
//  CorosHack_Athon
//
//  Created by Alumno on 13/05/25.
//
import SwiftUI

struct QuestionCard: View {
    let question: Question
    let onSelect: (Answer) -> Void

    @State private var isSelectionEnabled = false

    var body: some View {
        VStack(spacing: 20) {
            Text(question.text)
                .font(.title2)
                .multilineTextAlignment(.center)

            ForEach(question.options, id: \.text) { option in
                Button(action: {
                    if isSelectionEnabled {
                        onSelect(option)
                    }
                }) {
                    Text(option.text)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isSelectionEnabled ? Color.teal : Color.gray.opacity(0.3))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .opacity(isSelectionEnabled ? 1.0 : 0.5)
                        .animation(.easeInOut, value: isSelectionEnabled)
                }
                .disabled(!isSelectionEnabled)
            }
        }
        .onAppear {
            startTimer()
        }
        .onChange(of: question.id) {
            startTimer()
        }
    }

    private func startTimer() {
        isSelectionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            isSelectionEnabled = true
        }
    }
}
