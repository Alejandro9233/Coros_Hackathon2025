//
//  Question2.swift
//  CorosHack_Athon
//
//  Created by Alumno on 13/05/25.
//

import Foundation
import FirebaseFirestore

struct Answer: Codable, Identifiable {
    var id: String { text }
    let text: String
    let careerScores: [String: Int]
    let valueCode: String? // Solo se usa en preguntas 7 a 9
    }
// Ej. ["Ingeniería Mecatrónica": 1]

struct Question: Codable, Identifiable {
    @DocumentID var id: String?
    let text: String
    let options: [Answer]
}

