//
//  HomeWrapperView.swift
//  CorosHack_Athon
//
//  Created by Regina Cavazos Valdes on 13/05/25.
//
import SwiftUI

struct HomeWrapperView: View {
    @State private var isHomeActive = false
    @State private var selectedSheet: SheetType? = nil

    var body: some View {
        ZStack {
            if isHomeActive {
                HomeView(selectedSheet: $selectedSheet)
                    .transition(.opacity)
            } else {
                WelcomeView(isHomeActive: $isHomeActive, selectedSheet: $selectedSheet)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: isHomeActive)
    }
}
