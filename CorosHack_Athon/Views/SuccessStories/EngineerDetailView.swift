//
//  EngineerDetailView.swift
//  CorosHack_Athon
//
//  Created by Regina Cavazos Valdes on 13/05/25.
//

import SwiftUI

struct EngineerDetailView: View {
    let engineer: Engineer
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Image(engineer.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)

                    Text(engineer.name)
                        .font(.largeTitle)
                        .bold()

                    Text("Nacimiento: \(engineer.birthDate)")
                        .font(.subheadline)

                    if let death = engineer.deathDate {
                        Text("Fallecimiento: \(death)")
                            .font(.subheadline)
                    }

                    Divider()

                    Text(engineer.story)
                        .font(.body)
                        .lineSpacing(6)

                    Spacer()
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cerrar") {
                        dismiss()
                    }
                }
            }
        }
    }
}


#Preview {
    EngineerDetailView(engineer: Engineer(
        name: "Margaret Hamilton",
        imageName: "margaret",
        birthDate: "17 de agosto de 1936",
        deathDate: nil,
        story: "Margaret lideró el desarrollo del software del Apolo 11, logrando que el hombre llegara a la luna gracias a sus decisiones en tiempos críticos. Su trabajo cimentó las bases de la ingeniería de software moderna."
    ))
}
