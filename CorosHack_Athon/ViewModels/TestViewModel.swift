import Foundation

class TestViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var currentIndex: Int = 0
    @Published var selectedAnswers: [Answer] = []
    @Published var isFinished = false
    @Published var engineers: [EngineerTest] = []

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

        for answer in selectedAnswers.prefix(6) { // Solo las primeras 6 preguntas
            for (career, score) in answer.careerScores {
                scores[career, default: 0] += score
            }
        }

        return scores.max(by: { $0.value < $1.value })?.key ?? "Sin resultado"
    }

    func extractUserValues() -> [String] {
        let valueAnswers = selectedAnswers.suffix(3) // últimas 3 respuestas
        return valueAnswers.compactMap { $0.valueCode }
    }

    func findMatchingEngineer(from engineers: [EngineerTest], forCareer career: String) -> EngineerTest? {
        let userValues = Set(extractUserValues())

        print("📌 Valores del usuario: \(userValues)")
        print("🔍 Buscando ingenieras con carrera: [\(career)]")

        let trimmedCareer = career.trimmingCharacters(in: .whitespacesAndNewlines)

        let matchingByCareer = engineers.filter {
            $0.career.trimmingCharacters(in: .whitespacesAndNewlines) == trimmedCareer
        }

        if matchingByCareer.isEmpty {
            print("⚠️ No hay ingenieras con carrera exactamente igual a: [\(trimmedCareer)]")
        } else {
            print("✅ Ingenieras con carrera [\(trimmedCareer)]:")
            matchingByCareer.forEach { engineer in
                print("  - \(engineer.name) con valores \(engineer.values)")
            }
        }

        // Selección final por match de valores
        return matchingByCareer.max(by: { lhs, rhs in
            let lhsMatch = Set(lhs.values).intersection(userValues).count
            let rhsMatch = Set(rhs.values).intersection(userValues).count
            return lhsMatch < rhsMatch
        })
    }


    
    func fetchEngineers() {
        EngineerService.shared.fetchEngineers { loaded in
            DispatchQueue.main.async {
                self.engineers = loaded
            }
        }
    }

}
