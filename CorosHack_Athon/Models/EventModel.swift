//
//  EventModel.swift
//  CorosHack_Athon
//
//  Created by Regina Cavazos Valdes on 13/05/25.
//

import Foundation

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let location: String
    let state: String
    let description: String
    let imageName: String
    let isVirtual: Bool
}
