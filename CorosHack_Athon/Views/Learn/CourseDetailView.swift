//
//  CourseDetailView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import SwiftUI

struct CourseDetailView: View {
    let courseId: String
    @StateObject private var articleViewModel = ArticleViewModel()
    @StateObject private var quizViewModel = QuizViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        TabView {
            ForEach(articleViewModel.articles, id: \.id) { article in
                ArticleView(article: article, presentationMode: presentationMode)
            }
            
            QuizIntroView(totalArticles: articleViewModel.articles.count, presentationMode: presentationMode)
            
            ForEach(quizViewModel.quizQuestions.indices, id: \.self) { index in
                QuizView(question: quizViewModel.quizQuestions[index].question,
                         options: quizViewModel.quizQuestions[index].options,
                         correctAnswerIndex: quizViewModel.quizQuestions[index].correctAnswerIndex,
                         currentQuizIndex: index + 1,
                         totalQuizzes: quizViewModel.quizQuestions.count,
                         presentationMode: presentationMode)
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
