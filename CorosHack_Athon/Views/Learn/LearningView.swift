//
//  LearningView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 12/05/25.
//

import SwiftUI

struct LearningView: View {
    @StateObject private var courseViewModel = CourseViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Courses")
                        .font(.largeTitle)
                        .padding(.leading)
                    
                    ForEach(courseViewModel.courses) { course in
                        NavigationLink(destination: CourseDetailView(courseId: course.id)) {
                            CourseCard(
                                imageName: course.imageName,
                                courseName: course.courseName,
                                duration: course.duration,
                                questions: course.questions
                            )
                        }
                    }
                }
                .padding(.top)
            }
            .navigationBarTitle("Learn", displayMode: .inline)
            .onAppear {
                courseViewModel.fetchCourses()
            }
        }
    }
}

struct LearningView_Previews: PreviewProvider {
    static var previews: some View {
        LearningView()
    }
}
