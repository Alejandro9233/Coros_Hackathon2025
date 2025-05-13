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
        db.collection("courses").document(courseId).collection("articles")
            .order(by: "index") // Order articles by index field
            .getDocuments { (snapshot, error) in
                if let error = error {
                    print("Error fetching articles: \(error)")
                    completion([]) // Return an empty array on error
                    return
                }
                
                if let snapshot = snapshot {
                    let articles = snapshot.documents.compactMap { document in
                        try? document.data(as: Article.self)
                    }
                    completion(articles) // Return the sorted articles
                } else {
                    completion([]) // Return an empty array if snapshot is nil
                }
            }
    }
}

