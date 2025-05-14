//
//  EventsView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 12/05/25.
import SwiftUI

struct EventsView: View {
    @StateObject private var viewModel = EventsViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Header
                Text("Lo que pronto ocurrirá")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                // Filter row
                HStack {
                    VStack(alignment: .leading) {
                        Text("Selecciona tu estado")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Picker("Estado", selection: $viewModel.selectedState) {
                            ForEach(viewModel.availableStates, id: \.self) { state in
                                Text(state)
                            }
                        }
                        .pickerStyle(.menu)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    Button(action: {
                        // Future: Search community
                    }) {
                        Text("Buscar comunidad")
                            .font(.subheadline)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }
                .padding(.horizontal)

                // Event Cards
                VStack(spacing: 16) {
                    ForEach(viewModel.filteredEvents) { event in
                        EventCard(event: event)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
}
