//
//  Course.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import Foundation

struct Course: Identifiable, Codable {
    let id: String
    let imageName: String
    let courseName: String
    let duration: String
    let questions: Int
}

struct DisplayCourse: Identifiable {
    let course: Course
    let isCompleted: Bool
    let lotteryCheck: Bool
    
    var id: String { course.id } // Match Course ID type
}


