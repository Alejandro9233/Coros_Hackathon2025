//
//  QuizView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import SwiftUI
import Combine

struct QuizView: View {
    let question: String
    let options: [String]
    let correctAnswerIndex: Int
    let currentQuizIndex: Int
    let totalQuizzes: Int
    var presentationMode: Binding<PresentationMode>
    
    @State private var selectedAnswerIndex: Int? = nil
    @State private var isAnswerCorrect: Bool? = nil
    @State private var isCooldownActive: Bool = false
    @State private var countdown: Int = 4
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    init(question: String, options: [String], correctAnswerIndex: Int, currentQuizIndex: Int, totalQuizzes: Int, presentationMode: Binding<PresentationMode>) {
        self.question = question
        self.options = options
        self.correctAnswerIndex = correctAnswerIndex
        self.currentQuizIndex = currentQuizIndex
        self.totalQuizzes = totalQuizzes
        self.presentationMode = presentationMode
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Text("Learn")
                    .font(.headline)
                    .foregroundColor(.purple)
                
                Spacer()
                
                Button(action: {
                    // Additional actions
                }) {
                    Image(systemName: "ellipsis")
                        .font(.title)
                        .foregroundColor(.black)
                }
            }
            .padding()
            
            ProgressView(value: Float(currentQuizIndex), total: Float(totalQuizzes))
                .progressViewStyle(LinearProgressViewStyle(tint: .purple))
                .padding(.horizontal)
            
            Text("Quiz \(currentQuizIndex)/\(totalQuizzes)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Text(question)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ForEach(options.indices, id: \.self) { index in
                Button(action: {
                    handleAnswerSelection(index: index)
                }) {
                    HStack {
                        Text("\(Character(UnicodeScalar(65 + index)!)). \(options[index])")
                        Spacer()
                        if isCooldownActive && selectedAnswerIndex == index {
                            Text("0:\(String(format: "%02d", countdown))")
                                .foregroundColor(.red)
                                .font(.subheadline)
                        }
                    }
                    .padding()
                    .background(selectedAnswerIndex == index ?
                                (isAnswerCorrect == true ? Color.green : Color.red.opacity(0.2)) :
                                Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .foregroundColor(.black)
                }
                .disabled(isCooldownActive)
            }
            
            Spacer()
        }
        .background(Color.white)
        .onReceive(timer) { _ in
            if isCooldownActive {
                if countdown > 0 {
                    countdown -= 1
                } else {
                    isCooldownActive = false
                    selectedAnswerIndex = nil
                    countdown = 3
                }
            }
        }
    }
    
    private func handleAnswerSelection(index: Int) {
        if isCooldownActive {
            return
        }
        
        withAnimation {
            selectedAnswerIndex = index
            isAnswerCorrect = (index == correctAnswerIndex)
        }
        
        if isAnswerCorrect == true {
            // Proceed to the next question
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                // Add logic to move to the next question
                // For example, update the currentQuizIndex or navigate to the next view
            }
        } else {
            // Start cooldown for incorrect answer
            isCooldownActive = true
        }
    }
}
