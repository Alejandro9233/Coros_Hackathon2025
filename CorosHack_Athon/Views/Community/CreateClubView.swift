//
//  CreateClubView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import SwiftUI

struct CreateClubView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: CommunityViewModel
    
    @State private var name: String = ""
    @State private var members: String = ""
    @State private var location: String = ""
    @State private var posts: String = ""
    @State private var imageName: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Club Details")) {
                    TextField("Name", text: $name)
                    TextField("Members", text: $members)
                        .keyboardType(.numberPad)
                    TextField("Location", text: $location)
                    TextField("Posts", text: $posts)
                        .keyboardType(.numberPad)
                    TextField("ImageName", text: $imageName)
                }
                
                Button(action: {
                    if let membersInt = Int(members), let postsInt = Int(posts) {
                        viewModel.createClub(name: name, members: membersInt, location: location, posts: postsInt, imageName: imageName)
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Create Club")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("New Club")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
