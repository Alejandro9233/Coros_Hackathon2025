//
//  CommunityService.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import Foundation
import FirebaseFirestore

class CommunityService {
    private let db = Firestore.firestore()
    private let collectionName = "clubs"
    
    // Fetch all clubs
    func fetchClubs(completion: @escaping (Result<[Club], Error>) -> Void) {
        db.collection(collectionName).getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let documents = snapshot?.documents else {
                completion(.success([]))
                return
            }
            
            let clubs = documents.compactMap { document -> Club? in
                try? document.data(as: Club.self)
            }
            
            completion(.success(clubs))
        }
    }
    
    // Create a new club
    func createClub(_ club: Club, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            _ = try db.collection(collectionName).document(club.id).setData(from: club) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }
}
