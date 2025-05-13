//
//  QuizViewModel.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import Foundation
import Combine

class QuizViewModel: ObservableObject {
    @Published var quizQuestions: [QuizQuestion] = []
    private var cancellables = Set<AnyCancellable>()
    
    func fetchQuizQuestions(for courseId: String) {
        CourseService.shared.fetchQuizQuestions(for: courseId) { [weak self] questions in
            DispatchQueue.main.async {
                self?.quizQuestions = questions
            }
        }
    }
}
