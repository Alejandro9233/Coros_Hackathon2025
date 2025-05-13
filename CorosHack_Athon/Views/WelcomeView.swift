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
        ZStack {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.blue.opacity(0.7), Color.teal]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                // Top Phrase
                Text("FRASE ACÁ BIEN ACÁ")
                    .font(.headline)
                    .foregroundColor(.white)

                // Reflected Title
                VStack(spacing: -30) {
                    Text("IMPULSA")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.white)

                    // Reflection
                    Text("IMPULSA")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.white)
                        .opacity(0.3)
                        .scaleEffect(x: 1, y: -1)
                        .mask(
                            LinearGradient(gradient: Gradient(colors: [.black, .clear]),
                                           startPoint: .top,
                                           endPoint: .bottom)
                        )
                        .padding(.bottom, 10)
                }

                // "Tomar test vocacional" Button
                Button(action: {
                    isHomeActive = true
                }) {
                    Text("Tomar test vocacional")
                        .font(.title3)
                        .foregroundColor(Color.purple)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(14)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
                        .padding(.horizontal, 40)
                }

                // Subtext
                Text("Al realizar el test puedes ganar un boleto de concierto")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.horizontal, 40)
                    .multilineTextAlignment(.center)

              

                // Navigation Text
                Button(action: {
                    isHomeActive = true
                }) {
                    Text("Ir a la página principal")
                        .foregroundColor(.white)
                        .underline()
                }
                .padding(.bottom, 30)
            }
            .padding(.top, 60)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(isHomeActive: .constant(false))
    }
}
