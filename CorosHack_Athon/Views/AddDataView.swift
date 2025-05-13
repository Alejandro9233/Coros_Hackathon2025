//
//  AddDataView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import SwiftUI
import FirebaseFirestore

struct AddDataView: View {
    @State private var courseName = ""
    @State private var imageName = ""
    @State private var duration = ""
    @State private var lessons = ""
    
    @State private var articleTitle = ""
    @State private var articleContent = ""
    @State private var articleIndex = 0
    @State private var articleTotal = 1
    @State private var courseId = ""
    
    private let db = Firestore.firestore()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Course")) {
                    TextField("Course Name", text: $courseName)
                    TextField("Image Name", text: $imageName)
                    TextField("Duration", text: $duration)
                    TextField("Lessons", text: $lessons)
                    
                    Button("Add Course") {
                        addCourse()
                    }
                }
                
                Section(header: Text("Add Article")) {
                    TextField("Course ID", text: $courseId)
                    TextField("Article Title", text: $articleTitle)
                    TextField("Content", text: $articleContent)
                    TextField("Index", value: $articleIndex, formatter: NumberFormatter())
                    TextField("Total", value: $articleTotal, formatter: NumberFormatter())
                    
                    Button("Add Article") {
                        addArticle()
                    }
                }
            }
            .navigationTitle("Add Data")
        }
    }
    
    private func addCourse() {
        let course = Course(id: UUID().uuidString, imageName: imageName, courseName: courseName, duration: duration, lessons: lessons)
        do {
            try db.collection("courses").document(course.id).setData(from: course)
            print("Course added successfully")
        } catch {
            print("Error adding course: \(error)")
        }
    }
    
    private func addArticle() {
        let article = Article(id: UUID().uuidString, index: articleIndex, total: articleTotal, title: articleTitle, content: articleContent)
        do {
            try db.collection("courses").document(courseId).collection("articles").document(article.id).setData(from: article)
            print("Article added successfully")
        } catch {
            print("Error adding article: \(error)")
        }
    }
}

struct AddDataView_Previews: PreviewProvider {
    static var previews: some View {
        AddDataView()
    }
}
