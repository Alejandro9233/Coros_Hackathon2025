//
//  CourseViewModel.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import Foundation

class CourseViewModel: ObservableObject {
    private let courseService = CourseService.shared
    @Published var displayCourses: [DisplayCourse] = []

    func fetchCourses() {
        courseService.fetchCourses { fetchedCourses in
            DispatchQueue.main.async {
                self.displayCourses = fetchedCourses.map { course in
                    let isCompleted = UserDefaults.standard.bool(forKey: "course_completed_\(course.id)")
                    return DisplayCourse(course: course, isCompleted: isCompleted)
                }
            }
        }
    }

    func markCourseCompleted(_ id: String) {
        UserDefaults.standard.set(true, forKey: "course_completed_\(id)")
        if let index = displayCourses.firstIndex(where: { $0.course.id == id }) {
            let course = displayCourses[index].course
            displayCourses[index] = DisplayCourse(course: course, isCompleted: true)
        }
    }
}
