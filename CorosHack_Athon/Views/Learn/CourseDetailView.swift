//
//  CourseDetailView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import SwiftUI

import SwiftUI

struct CourseDetailView: View {
    let courseId: String
    var isCompleted: Bool
    @ObservedObject var courseViewModel: CourseViewModel

    @StateObject private var articleViewModel = ArticleViewModel()
    @StateObject private var quizViewModel = QuizViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTab = 0 // ⭐️ Add this

    var body: some View {
        TabView(selection: $selectedTab) {
           
            if articleViewModel.articles.isEmpty {
                ProgressView()
            } else {
                ForEach(articleViewModel.articles.indices, id: \.self) { index in
                    ArticleView(article: articleViewModel.articles[index], presentationMode: presentationMode)
                        .tag(index) // ⭐️ tag for tab selection
                }

              
                if isCompleted {
                    QuizCompletedView(courseViewModel: courseViewModel,
                                       courseId: courseId)
                        .tag(articleViewModel.articles.count) // ⭐️ next tab index
                } else {
                    QuizIntroView(totalArticles: articleViewModel.articles.count, presentationMode: presentationMode)
                        .tag(articleViewModel.articles.count) // ⭐️ next tab index

                    ForEach(quizViewModel.quizQuestions.indices, id: \.self) { index in
                        QuizView(
                            question: quizViewModel.quizQuestions[index].question,
                            options: quizViewModel.quizQuestions[index].options,
                            correctAnswerIndex: quizViewModel.quizQuestions[index].correctAnswerIndex,
                            currentQuizIndex: index + 1,
                            totalQuizzes: quizViewModel.quizQuestions.count,
                            presentationMode: presentationMode,
                            courseViewModel: courseViewModel,
                            courseId: courseId
                        )
                        .tag(articleViewModel.articles.count + 1 + index) // ⭐️ continuous index
                    }
                }
            }
            
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .navigationBarHidden(true)
        .onAppear {
            selectedTab = 0 // ✅ Always start at first article
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
            
            Image(article.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .cornerRadius(15)
                .padding()
            
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
