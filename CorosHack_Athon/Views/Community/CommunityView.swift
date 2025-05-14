import SwiftUI

struct CommunityView: View {
    @StateObject private var viewModel = CommunityViewModel()
    @State private var showCreateClubModal = false
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            HeaderView(showCreateClubModal: $showCreateClubModal)
            
            if isLoading {
                ProgressView("Loading...")
                    .padding()
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else if viewModel.clubs.isEmpty {
                Text("No clubs available. Create one to get started!")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ScrollView {
                    
                    VStack(spacing: 10) {
                        ForEach(viewModel.clubs) { club in
                            ClubInfoView(club: club)
                        }
                    }
                }
                .background(Color(UIColor.systemGray6))
            }
            
            Spacer()
        }
        .onAppear {
            fetchClubs()
        }
        .sheet(isPresented: $showCreateClubModal) {
            CreateClubView(viewModel: viewModel)
        }
    }
    
    private func fetchClubs() {
        isLoading = true
        viewModel.fetchClubs()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Simulate network delay
            isLoading = false
        }
    }
}

struct HeaderView: View {
    @Binding var showCreateClubModal: Bool
    
    var body: some View {
        HStack {
            Text("Create your own Community")
                .font(.headline)
            Spacer()
            Button(action: {
                showCreateClubModal.toggle()
            }) {
                Text("Create a Club")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct ClubInfoView: View {
    var club: Club
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(club.name)
                .font(.title2)
                .bold()
            
            HStack {
                Image(club.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                Text("\(club.members) Members")
            }
            
            Text("\(club.location) · \(club.posts) posts")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.white))
        .frame(maxWidth: .infinity)
    }
}

