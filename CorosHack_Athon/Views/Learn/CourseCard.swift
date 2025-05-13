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
    var lessons: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(courseName)
                    .font(.headline)
                
                Text("\(duration) • \(lessons)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }
            .padding([.leading, .trailing, .bottom])
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
            lessons: "4 Lessons"
        )
    }
}
