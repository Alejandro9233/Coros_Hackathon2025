//
//  QuizIntroView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import SwiftUI

struct QuizIntroView: View {
    let totalArticles: Int
    var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
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
            
            ProgressView(value: Float(totalArticles + 1), total: Float(totalArticles + 1))
                .progressViewStyle(LinearProgressViewStyle(tint: .purple))
                .padding(.horizontal)
            
            Spacer()
            
            Image(systemName: "doc.text")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.purple)
                .padding()
            
            Text("It's time to test your knowledge")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text("Challenge yourself with quizzes and track your progress")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Spacer()
        }
        .background(Color.white)
    }
}
