//
//  Event.swift
//  CorosHack_Athon
//
//  Created by Alumno on 13/05/25.
//

import Foundation

struct Event: Identifiable, Codable {
    let id: String
    let name: EventText
    let description: EventText
    let start: DateInfo
    let end: DateInfo
    let url: String
    let online_event: Bool
    let logo: Logo?
}

struct EventText: Codable {
    let text: String?
}

struct DateInfo: Codable {
    let local: String
}

struct Logo: Codable {
    let url: String?
}


