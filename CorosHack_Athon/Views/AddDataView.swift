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
    @State private var questions: Int = 0
    
    @State private var articleTitle = ""
    @State private var articleContent = ""
    @State private var articleIndex = 0
    @State private var articleTotal = 1
    @State private var courseId = ""
    
    @State private var courses: [Course] = []
    @State private var selectedCourseIndex = 0
    
    private let db = Firestore.firestore()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Course")) {
                    TextField("Course Name", text: $courseName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Image Name", text: $imageName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Duration", text: $duration)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Questions", value: $questions, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Add Course") {
                        addCourse()
                    }
                }
                
                Section(header: Text("Add Article")) {
                    Picker("Select Course", selection: $selectedCourseIndex) {
                        ForEach(0..<courses.count, id: \.self) { index in
                            Text(courses[index].courseName).tag(index)
                        }
                    }
                    
                    TextField("Article Title", text: $articleTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Content", text: $articleContent)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Index", value: $articleIndex, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Total", value: $articleTotal, formatter: NumberFormatter())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Add Article") {
                        addArticle()
                    }
                }
            }
            .navigationTitle("Add Data")
            .onAppear(perform: fetchCourses)
        }
    }
    
    private func fetchCourses() {
        db.collection("courses").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching courses: \(error)")
                return
            }
            
            if let snapshot = snapshot {
                self.courses = snapshot.documents.compactMap { document in
                    try? document.data(as: Course.self)
                }
            }
        }
    }
    
    private func addCourse() {
        let course = Course(id: UUID().uuidString, imageName: imageName, courseName: courseName, duration: duration, questions: questions)
        do {
            try db.collection("courses").document(course.id).setData(from: course)
            print("Course added successfully")
        } catch {
            print("Error adding course: \(error)")
        }
    }
    
    private func addArticle() {
        guard !courses.isEmpty else { return }
        let selectedCourse = courses[selectedCourseIndex]
        let article = Article(id: UUID().uuidString, index: articleIndex, total: articleTotal, title: articleTitle, content: articleContent)
        do {
            try db.collection("courses").document(selectedCourse.id).collection("articles").document(article.id).setData(from: article)
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
