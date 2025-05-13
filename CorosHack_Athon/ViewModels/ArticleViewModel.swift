//
//  ArticleViewModel.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = []
    private let courseService = CourseService.shared
    
    func fetchArticles(for courseId: String) {
        courseService.fetchArticles(for: courseId) { (fetchedArticles: [Article]) in
            DispatchQueue.main.async {
                self.articles = fetchedArticles
            }
        }
    }
}
