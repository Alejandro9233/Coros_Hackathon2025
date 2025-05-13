//
//  WelcomeView.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 12/05/25.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var isHomeActive: Bool

    var body: some View {
        VStack {
            Text("Welcome to YourApp")
                .font(.largeTitle)
                .padding()

            Button(action: {
                isHomeActive = true
            }) {
                Text("Start")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(isHomeActive: .constant(false))
    }
}
