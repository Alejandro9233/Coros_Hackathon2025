//
//  CourseDetailView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import SwiftUI

struct CourseDetailView: View {
    let courseId: String
    var isCompleted: Bool
    @ObservedObject var courseViewModel: CourseViewModel
    
    @StateObject private var articleViewModel = ArticleViewModel()
    @StateObject private var quizViewModel = QuizViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        TabView {
            
            if articleViewModel.articles.isEmpty {
                ProgressView("Cargando información...")
                    .frame(maxWidth: .infinity)
                    .padding()
            } else {
                
                ForEach(articleViewModel.articles, id: \.id) { article in
                    ArticleView(article: article, presentationMode: presentationMode)
                }
                
                if isCompleted {
                    QuizCompletedView()
                } else {
                    QuizIntroView(totalArticles: articleViewModel.articles.count, presentationMode: presentationMode)
                    
                    ForEach(quizViewModel.quizQuestions.indices, id: \.self) { index in
                        QuizView(question: quizViewModel.quizQuestions[index].question,
                                 options: quizViewModel.quizQuestions[index].options,
                                 correctAnswerIndex: quizViewModel.quizQuestions[index].correctAnswerIndex,
                                 currentQuizIndex: index + 1,
                                 totalQuizzes: quizViewModel.quizQuestions.count,
                                 presentationMode: presentationMode,
                                 courseViewModel: courseViewModel,
                                 courseId: courseId)
                    }
                }
            }
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .navigationBarHidden(true)
        .onAppear {
            articleViewModel.fetchArticles(for: courseId)
            quizViewModel.fetchQuizQuestions(for: courseId)
        }
    }
}


struct ArticleView: View {
    let article: Article
    var presentationMode: Binding<PresentationMode>

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
            
            ProgressView(value: Float(article.index + 1), total: Float(article.total))
                .progressViewStyle(LinearProgressViewStyle(tint: .purple))
                .padding(.horizontal)
            
            Text("Article \(article.index + 1)/\(article.total)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Text(article.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            Text(article.content)
                .font(.body)
                .padding(.horizontal)
            
            Spacer()
            
            Image("exampleImage") // Replace with actual image
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
        }
        .background(Color.white)
    }
}
