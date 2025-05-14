//
//  TestView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 12/05/25.
//

import SwiftUI

struct TestView: View {
    @StateObject private var viewModel = TestViewModel()

    var body: some View {
        VStack {
            if viewModel.questions.isEmpty {
                ProgressView("Cargando preguntas...")
                    .onAppear {
                        viewModel.fetchQuestions()
                    }

            } else if viewModel.isFinished {
                ResultView(viewModel: viewModel, onRestart: viewModel.resetTest)
            } else {
                QuestionCard(
                    question: viewModel.questions[viewModel.currentIndex],
                    onSelect: { selected in
                        viewModel.selectAnswer(selected)
                    }
                )

            } else {
                Text("Cargando pregunta...")
            }
        }
        .padding()
    }
}

#Preview {
    TestView()
}
