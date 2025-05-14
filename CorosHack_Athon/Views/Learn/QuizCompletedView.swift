//
//  QuizCompletedView.swift
//  CorosHack_Athon
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI
import ConfettiSwiftUI

struct QuizCompletedView: View {
    @ObservedObject var courseViewModel: CourseViewModel
    let courseId: String

    @Environment(\.presentationMode) var presentationMode
    @State private var confettiCounter = 0
    @State private var hasParticipated = false
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 24) {
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
                
                
                Spacer()

                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)

                Text("Curso completado")
                    .font(.title)
                    .fontWeight(.semibold)

                Text("Haz contestado todas las preguntas correctamente, avanza al siguiente curso")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Spacer()

                // ✅ Conditional navigation link using value:
                if !hasParticipated {
                    Button(action: {
                        courseViewModel.markCourseCompleted(courseId, markLotteryCheck: true)
                        UserDefaults.standard.set(true, forKey: "lottery_check_\(courseId)")
                        hasParticipated = true
                        path.append("lottery") // <- trigger programmatic navigation
                    }) {
                        HStack {
                            Text("Participar en Sorteo")
                                .foregroundColor(Color(hex: "#F2BC57"))
                                .underline()
                            Image(systemName: "arrowshape.forward.circle.fill")
                                .foregroundColor(Color(hex: "#F2BC57"))
                        }
                    }
                }
            }
            .navigationDestination(for: String.self) { value in
                if value == "lottery" {
                    LotteryResultView()
                }
            }
            .confettiCannon(trigger: $confettiCounter, num: 30, colors: [.purple, .green, .orange])
            .onAppear {
                confettiCounter += 1
                hasParticipated = UserDefaults.standard.bool(forKey: "lottery_check_\(courseId)")
            }
            .background(Color.white.ignoresSafeArea())
        }
    }
}
