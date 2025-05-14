//
//  LotteryResultViewModel.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import Foundation

class LotteryResultViewModel: ObservableObject {
    @Published var isWinner: Bool = false
    @Published var winnerCode: String = ""
    
    func generateWinner() {
        isWinner = Bool.random()
        if isWinner {
            winnerCode = generateRandomCode()
        }
    }
    
    private func generateRandomCode() -> String {
        let characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<6).map { _ in characters.randomElement()! })
    }
}
