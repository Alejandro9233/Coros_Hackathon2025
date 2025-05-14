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
                    Text("Cursos")
                        .font(.largeTitle)
                        .padding(.leading)
                    
                    if courseViewModel.displayCourses.isEmpty {
                        ProgressView("Cargando cursos...")
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                        else {
                            
                            ForEach(courseViewModel.displayCourses) { displayCourse in
                                NavigationLink(destination: CourseDetailView(courseId: displayCourse.course.id, isCompleted: displayCourse.isCompleted, courseViewModel: courseViewModel))  {
                                    CourseCard(
                                        imageName: displayCourse.course.imageName,
                                        courseName: displayCourse.course.courseName,
                                        duration: displayCourse.course.duration,
                                        questions: displayCourse.course.questions,
                                        isCompleted: displayCourse.isCompleted
                                    )
                                }
                            }

                        }
                }
                .padding(.top)
            }
            .navigationBarTitle("Aprendizaje", displayMode: .inline)
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
