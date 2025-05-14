//
//  EngineerService.swift
//  CorosHack_Athon
//
//  Created by Regina Cavazos Valdes on 13/05/25.
//
import Foundation
import FirebaseFirestore
import Firebase

class EngineerService {
    static let shared = EngineerService()
    private let db = Firestore.firestore()

    func fetchEngineers(completion: @escaping ([EngineerTest]) -> Void) {
        db.collection("engineers").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else {
                completion([])
                return
            }

            let engineers = documents.compactMap { try? $0.data(as: EngineerTest.self) }
            completion(engineers)
        }
    }
}
