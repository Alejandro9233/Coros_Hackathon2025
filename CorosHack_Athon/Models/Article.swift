//
//  Article.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import Foundation

struct Article: Identifiable, Codable {
    let id: String
    let index: Int
    let total: Int
    let title: String
    let content: String
    let imageName: String
}

