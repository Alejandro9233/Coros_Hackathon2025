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
    @ObservedObject var courseViewModel: CourseViewModel
    let courseId: String
    
    @State private var selectedAnswerIndex: Int? = nil
    @State private var isAnswerCorrect: Bool? = nil
    @State private var isCooldownActive: Bool = false
    @State private var countdown: Int = 4
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    init(question: String, options: [String], correctAnswerIndex: Int, currentQuizIndex: Int, totalQuizzes: Int, presentationMode: Binding<PresentationMode>, courseViewModel: CourseViewModel, courseId: String) {
        self.question = question
        self.options = options
        self.correctAnswerIndex = correctAnswerIndex
        self.currentQuizIndex = currentQuizIndex
        self.totalQuizzes = totalQuizzes
        self.presentationMode = presentationMode
        self.courseViewModel = courseViewModel
        self.courseId = courseId
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
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
            // ✅ If it's the last quiz, mark the course as completed
            if currentQuizIndex == totalQuizzes {
                courseViewModel.markCourseCompleted(courseId)
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                // Advance or dismiss — your existing logic here
            }
        } else {
            isCooldownActive = true
        }
    }

}
