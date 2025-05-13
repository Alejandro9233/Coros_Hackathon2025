//
//  QuizCompletedView.swift
//  CorosHack_Athon
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI
import ConfettiSwiftUI // You need this package

struct QuizCompletedView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var confettiCounter = 0

    var body: some View {
        VStack(spacing: 24) {
            // Top Bar
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                }
                Spacer()
                Image(systemName: "graduationcap.circle.fill")
                    .font(.title2)
                    .foregroundColor(.purple)
                Text("Learn")
                    .font(.headline)
                    .foregroundColor(.purple)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                }
            }

            Spacer()

            // Medal or Laurel
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
            Text("Curso completado")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.black)

            Text("Haz contestado todas las preguntas corrrectamente, avanza al siguiente curso")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()

            
        }
        .confettiCannon(trigger: $confettiCounter, num: 30, colors: [.purple, .green, .orange])
        .onAppear {
            confettiCounter += 1 // Trigger confetti once
        }
        .background(Color.white.ignoresSafeArea())
    }
}

#Preview {
    QuizCompletedView()
}
