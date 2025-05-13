//
//  EngineerListView.swift
//  CorosHack_Athon
//
//  Created by Regina Cavazos Valdes on 13/05/25.
//

import SwiftUI

struct EngineerListView: View {
    @State private var selectedEngineer: Engineer? = nil
    @State private var showDetail = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(engineers) { engineer in
                        Button(action: {
                            selectedEngineer = engineer
                            showDetail = true
                        }) {
                            HStack {
                                Image(engineer.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .padding(.trailing, 8)

                                VStack(alignment: .leading) {
                                    Text(engineer.name)
                                        .font(.headline)
                                    Text("Haz clic para conocer su historia")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }

                                Spacer()
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                            .shadow(radius: 1)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Ingenieras Revolucionarias")
            .fullScreenCover(item: $selectedEngineer) { engineer in
                            EngineerDetailView(engineer: engineer)
                        }
        }
    }
}


#Preview {
    EngineerListView()
}
