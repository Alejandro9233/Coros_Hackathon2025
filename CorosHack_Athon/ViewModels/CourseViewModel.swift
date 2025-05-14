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
                    let lotteryCheck = UserDefaults.standard.bool(forKey: "lottery_check_\(course.id)")
                    return DisplayCourse(course: course, isCompleted: isCompleted, lotteryCheck: lotteryCheck)
                }
            }
        }
    }

    func markCourseCompleted(_ id: String, markLotteryCheck: Bool = false) {
        UserDefaults.standard.set(true, forKey: "course_completed_\(id)")
        if markLotteryCheck {
            UserDefaults.standard.set(true, forKey: "lottery_check_\(id)")
        }

        if let index = displayCourses.firstIndex(where: { $0.course.id == id }) {
            let course = displayCourses[index].course
            let updatedLotteryCheck = UserDefaults.standard.bool(forKey: "lottery_check_\(id)")
            displayCourses[index] = DisplayCourse(course: course, isCompleted: true, lotteryCheck: updatedLotteryCheck)
        }
    }

}
