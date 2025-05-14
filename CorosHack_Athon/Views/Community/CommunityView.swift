import SwiftUI

struct CommunityView: View {
    @StateObject private var viewModel = CommunityViewModel()
    @State private var showCreateClubModal = false
    @State private var isLoading = true
    @State private var searchText = ""

    var filteredClubs: [Club] {
        if searchText.isEmpty {
            return viewModel.clubs
        } else {
            return viewModel.clubs.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(showCreateClubModal: $showCreateClubModal)

            // 🔍 Search Bar Below Header
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search clubs", text: $searchText)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding()
            .background(Color(UIColor.systemGray5))
            .cornerRadius(10)
            .padding([.horizontal, .top])

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
                    VStack(spacing: 12) {
                        ForEach(filteredClubs) { club in
                            ClubCardView(club: club)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 5)
                }
                .background(Color.white)
            }

            Spacer()
        }
        .onAppear {
            fetchClubs()
        }
        .sheet(isPresented: $showCreateClubModal) {
            CreateClubView(viewModel: viewModel)
        }
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }

    private func fetchClubs() {
        isLoading = true
        viewModel.fetchClubs()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isLoading = false
        }
    }
}


struct HeaderView: View {
    @Binding var showCreateClubModal: Bool

    var body: some View {
        HStack {
            Text("Comunidades de ingenieros")
                .font(.headline)
            Spacer()
            Button(action: {
                showCreateClubModal.toggle()
            }) {
                Text("Crea tu comunidad")
                    .font(.subheadline)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ClubCardView: View {
    var club: Club

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(club.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 4) {
                Text(club.name)
                    .font(.headline)
                    .foregroundColor(.black)

                Text("👥 \(club.members) members")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text("📍\(club.location)")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}


