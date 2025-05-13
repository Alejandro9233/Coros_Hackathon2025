//
//  ContentView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 12/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isHomeActive = false

    var body: some View {
        if isHomeActive {
            HomeView()
        } else {
            WelcomeView(isHomeActive: $isHomeActive)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
