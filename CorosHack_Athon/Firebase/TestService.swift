//
//  TestService.swift
//  CorosHack_Athon
//
//  Created by Alumno on 13/05/25.
//

import Foundation
import FirebaseFirestore


class TestService {
    static let shared = TestService()
    private init() {}

    private let db = Firestore.firestore()

    func fetchQuestions(completion: @escaping ([Question]) -> Void) {
        db.collection("questions").order(by: FieldPath.documentID()).getDocuments { snapshot, error in
            if let error = error {
                print("Error al obtener preguntas: \(error)")
                completion([])
                return
            }

            let questions = snapshot?.documents.compactMap { doc in
                try? doc.data(as: Question.self)
            } ?? []

            completion(questions)
        }
    }
}
