//
//  CourseViewModel.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import Foundation

class CourseViewModel: ObservableObject {
    @Published var courses: [Course] = []
    private let courseService = CourseService.shared
    
    func fetchCourses() {
        courseService.fetchCourses { (fetchedCourses: [Course]) in
            DispatchQueue.main.async {
                self.courses = fetchedCourses
            }
        }
    }
}
