//
//  LearningView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 12/05/25.
//

import SwiftUI

struct LearningView: View {
    let courses = [
        ("world", "Intro to World", "12 Minutes", "4 Lessons"),
        ("worldApp", "World App", "10 Minutes", "3 Lessons")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Courses")
                        .font(.largeTitle)
                        .padding(.leading)
                    
                    ForEach(courses, id: \.0) { course in
                        CourseCard(
                            imageName: course.0,
                            courseName: course.1,
                            duration: course.2,
                            lessons: course.3)
                    }
                }
                .padding(.top)
            }
            .navigationBarTitle("Learn", displayMode: .inline)
        }
    }
}

struct LearningView_Previews: PreviewProvider {
    static var previews: some View {
        LearningView()
    }
}
