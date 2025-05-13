//
//  CourseService.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import Foundation
import FirebaseFirestore

class CourseService {
    static let shared = CourseService()
    private let db = Firestore.firestore()
    
    private init() {}
    
    func fetchCourses(completion: @escaping ([Course]) -> Void) {
        db.collection("courses").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("No courses found")
                return
            }
            let courses = documents.compactMap { (queryDocumentSnapshot) -> Course? in
                return try? queryDocumentSnapshot.data(as: Course.self)
            }
            completion(courses)
        }
    }
    
    func fetchArticles(for courseId: String, completion: @escaping ([Article]) -> Void) {
        db.collection("courses/\(courseId)/articles").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("No articles found")
                return
            }
            let articles = documents.compactMap { (queryDocumentSnapshot) -> Article? in
                return try? queryDocumentSnapshot.data(as: Article.self)
            }
            completion(articles)
        }
    }
}

