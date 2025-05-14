//
//  EventsViewModel.swift
//  CorosHack_Athon
//
//  Created by Regina Cavazos Valdes on 13/05/25.
//
import Foundation
class EventsViewModel: ObservableObject {
    @Published var selectedState: String = "Todos"
    @Published var events: [Event] = allEvents

    let allStates = [
        "Aguascalientes", "Baja California", "Baja California Sur", "Campeche", "Chiapas",
        "Chihuahua", "Ciudad de México", "Coahuila", "Colima", "Durango", "Estado de México",
        "Guanajuato", "Guerrero", "Hidalgo", "Jalisco", "Michoacán", "Morelos", "Nayarit",
        "Nuevo León", "Oaxaca", "Puebla", "Querétaro", "Quintana Roo", "San Luis Potosí",
        "Sinaloa", "Sonora", "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatán", "Zacatecas"
    ]

    var availableStates: [String] {
        ["Todos"] + allStates
    }

    var filteredEvents: [Event] {
        if selectedState == "Todos" {
            return events
        } else {
            return events.filter { $0.state == selectedState }
        }
    }
}
