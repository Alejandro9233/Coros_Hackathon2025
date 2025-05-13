//
//  HomeView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 12/05/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedSheet: SheetType?

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image(systemName: "house.fill")
                    .font(.title)
                    .foregroundColor(.purple)
                
                Spacer()
                
                Button(action: {
                    selectedSheet = .second // Assuming "Tomar Test" opens TestView
                }) {
                    Text("Tomar Test")
                        .font(.headline)
                        .padding()
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            Text("1 de cada 15 mujeres estudia ingeniería, súmate al cambio")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            Divider()
                .background(Color.purple)
                .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(SheetType.allCases, id: \.self) { sheet in
                        Button(action: {
                            selectedSheet = sheet
                        }) {
                            InfoCard(iconName: sheet.iconName, title: sheet.cardTitle, description: sheet.cardDescription)
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .sheet(item: $selectedSheet) { sheet in
            sheet.view
        }
    }
}
