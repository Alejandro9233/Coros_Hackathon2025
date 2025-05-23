//
//  HomeView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 12/05/25.
//
import SwiftUI

struct HomeView: View {
    @Binding var selectedSheet: SheetType?
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image(systemName: "house.fill")
                    .font(.title)
                    .foregroundColor(.purple)
                
                Spacer()
                
                Button(action: {
                    selectedSheet = .second
                }) {
                    Text("Tomar Test")
                        .font(.headline)
                        .padding()
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(100)
                }
            }
            .padding()
            
            Text("Cuando un joven elige la ingeniería, transforma no solo su futuro, sino el de toda la sociedad.")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            Divider()
                .frame(height: 2)
                .frame(maxWidth: 100)
                .background(Color.purple)
                .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 20) {
                    if let aprendizaje = SheetType.allCases.first {
                        Button(action: {
                            selectedSheet = aprendizaje
                        }) {
                            InfoCard(iconName: aprendizaje.iconName,
                                     title: aprendizaje.cardTitle,
                                     description: aprendizaje.cardDescription,
                                     backgroundColor: .teal, height: 179)
                                .frame(maxWidth: .infinity)
                        }
                    }

                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(SheetType.allCases.dropFirst().dropLast(), id: \.self) { sheet in
                            Button(action: {
                                selectedSheet = sheet
                            }) {
                                InfoCard(iconName: sheet.iconName,
                                         title: sheet.cardTitle,
                                         description: sheet.cardDescription,
                                         imageBackground: .purple, height: 159)
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }

                    if let eventos = SheetType.allCases.last {
                        Button(action: {
                            selectedSheet = eventos
                        }) {
                            HStack(alignment: .center, spacing: 12) {
                                Image(systemName: eventos.iconName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Circle().fill(Color.white.opacity(0.2)))

                                VStack(alignment: .leading, spacing: 6) {
                                    Text(eventos.cardTitle)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)

                                    Text(eventos.cardDescription)
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.9))
                                }

                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 79, maxHeight: 79)
                            .background(Color.purple)
                            .cornerRadius(20)
                        }
                    }
                }
                .padding()
            }
        }
        .sheet(item: $selectedSheet) { sheet in
            sheet.view
        }
    }
}
