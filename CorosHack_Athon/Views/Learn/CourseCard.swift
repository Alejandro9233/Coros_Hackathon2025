//
//  CourseCard.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import SwiftUI

struct CourseCard: View {
    var imageName: String
    var courseName: String
    var duration: String
    var questions: Int // Changed to Int
    var isCompleted: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(15)
            
            HStack() {
                VStack(alignment: .leading, spacing: 5) {
                    Text(courseName)
                        .font(.headline)
                    
                    // Display the number of questions as a string
                    Text("\(duration) • \(questions) Questions") // Updated to display questions as Int
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                }
                .padding([.leading, .trailing, .bottom])
                
                Spacer()
                
                if isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.green)
                        .padding()
                } else {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                        .padding()
                }
                
            }
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
        .padding(.horizontal)
    }
}

struct CourseCard_Previews: PreviewProvider {
    static var previews: some View {
        CourseCard(
            imageName: "world",
            courseName: "Intro to World",
            duration: "12 Minutes",
            questions: 5, // Pass an Int for questions
            isCompleted: true
        )
    }
}
