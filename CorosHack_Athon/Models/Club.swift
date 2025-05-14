//
//  Club.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import Foundation

struct Club: Codable, Identifiable {
    let id: String
    let name: String
    let members: Int
    let location: String
    let posts: Int
    let imageName: String
}
