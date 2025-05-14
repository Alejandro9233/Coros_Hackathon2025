//
//  CommunityViewModel.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import Foundation
import Combine

class CommunityViewModel: ObservableObject {
    @Published var clubs: [Club] = []
    @Published var errorMessage: String? = nil
    
    private var communityService = CommunityService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchClubs()
    }
    
    func fetchClubs() {
        communityService.fetchClubs { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let clubs):
                    self?.clubs = clubs
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func createClub(name: String, members: Int, location: String, posts: Int, imageName: String) {
        let newClub = Club(id: UUID().uuidString, name: name, members: members, location: location, posts: posts, imageName: imageName)
        
        communityService.createClub(newClub) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.fetchClubs() // Refresh the list after adding a new club
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
