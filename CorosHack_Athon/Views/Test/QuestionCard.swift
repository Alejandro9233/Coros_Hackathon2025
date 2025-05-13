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

    var body: some View {
        VStack(spacing: 20) {
            Text(question.text)
                .font(.title2)
                .multilineTextAlignment(.center)

            ForEach(question.options, id: \.text) { option in
                Button(action: {
                    onSelect(option)
                }) {
                    Text(option.text)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
        }
    }
}
