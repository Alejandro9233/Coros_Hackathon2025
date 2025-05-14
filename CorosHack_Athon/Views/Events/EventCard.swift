//
//  EventCard.swift
//  CorosHack_Athon
//

//  Created by Regina Cavazos Valdes on 13/05/25.
//
//  Created by Alumno on 13/05/25.
//


import SwiftUI

struct EventCard: View {
    let event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Placeholder for event image
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 150)
                .cornerRadius(8)
                .overlay(Text("🖼 Imagen aquí").foregroundColor(.gray))

            // Text content
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(event.title)
                        .font(.headline)
                        .foregroundColor(Color(hex: "#8759D1"))
                    Spacer()
                    if event.isVirtual {
                        Text("Virtual")
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(12)
                            .foregroundColor(.mint)
                    }
                }

                Text(event.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(event.description)
                    .font(.body)
                    .foregroundColor(.black)
            }
            .padding([.horizontal, .bottom])
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

    var body: some View {
        VStack(alignment: .leading) {
            Text("hola")
            
        }
    }


