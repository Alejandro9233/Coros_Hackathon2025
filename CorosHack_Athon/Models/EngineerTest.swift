//
//  EngineerTest.swift
//  CorosHack_Athon
//
//  Created by Regina Cavazos Valdes on 13/05/25.
//

import Foundation

struct EngineerTest: Identifiable, Codable {
    let id: String
    let name: String
    let career: String
    let values: [String] // Ej. ["A", "E"]
    let description: String?
}
