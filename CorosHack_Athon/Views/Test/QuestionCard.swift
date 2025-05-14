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
    @State private var selectedAnswer: Answer? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            // 🟣 Barra de progreso
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Pregunta \(String(question.id?.dropFirst().prefix(1) ?? "")) de 11")
                        .font(.subheadline)
                        .foregroundColor(.teal)
                    Spacer()
                }

            }

            // 🟣 Título de la pregunta
            Text(question.text)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)

            Text("Selecciona la respuesta con la que estas de acuerdo")
                .font(.subheadline)
                .foregroundColor(.gray)

            // 🟣 Opciones de respuesta
            VStack(spacing: 12) {
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
                                           .foregroundColor(isSelectionEnabled ? .white : .black) // 👈 Change here
                                           .cornerRadius(12)
                                           .opacity(isSelectionEnabled ? 1.0 : 0.5)
                                           .animation(.easeInOut, value: isSelectionEnabled)
                                   }
                                   .disabled(!isSelectionEnabled)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding()
        .onAppear {
            startTimer()
        }
        .onChange(of: question.id) { _ in
            startTimer()
            selectedAnswer = nil
        }
    }

    private func startTimer() {
        isSelectionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            isSelectionEnabled = true
        }
    }
}
