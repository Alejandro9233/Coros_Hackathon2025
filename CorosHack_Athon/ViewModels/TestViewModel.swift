//
//  TestViewModel.swift
//  CorosHack_Athon
//
//  Created by Alumno on 13/05/25.
//

import Foundation

class TestViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var currentIndex: Int = 0
    @Published var selectedAnswers: [Answer] = []
    @Published var isFinished = false
    
    private let testService = TestService.shared
    
    func fetchQuestions() {
        testService.fetchQuestions { fetchedQuestions in
            DispatchQueue.main.async {
                self.questions = fetchedQuestions
            }
        }
    }
    
    func selectAnswer(_ answer: Answer) {
        selectedAnswers.append(answer)
        if currentIndex + 1 < questions.count {
            currentIndex += 1
        } else {
            isFinished = true
        }
    }
    
    func resetTest() {
        currentIndex = 0
        selectedAnswers = []
        isFinished = false
    }
    
    func calculateCareerResult() -> String {
        var scores: [String: Int] = [:]
        
        for answer in selectedAnswers {
            for (career, score) in answer.careerScores {
                scores[career, default: 0] += score
            }
        }
        
        return scores.max(by: { $0.value < $1.value })?.key ?? "Sin resultado"
    }
}
