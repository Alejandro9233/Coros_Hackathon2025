//
//  ContentView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 12/05/25.
//
import SwiftUI

struct ContentView: View {
    @State private var isHomeActive = false
    @State private var selectedSheet: SheetType? = nil  // <-- agrega esta línea

    var body: some View {
        ZStack {
            if isHomeActive {
                HomeView(selectedSheet: $selectedSheet)  // <-- solución
                    .transition(.opacity)
            } else {
                WelcomeView(isHomeActive: $isHomeActive, selectedSheet: $selectedSheet)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: isHomeActive)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
