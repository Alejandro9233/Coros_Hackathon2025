//
//  ResultView.swift
//  CorosHack_Athon
//
//  Created by Alumno on 13/05/25.
//

import SwiftUI

struct ResultView: View {
    let result: String
    let onRestart: () -> Void
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 24) {
                Spacer()
                Text("¡Tu carrera ideal es:")
                    .font(.title)
                
                Text(result)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                
                Button("Reiniciar test") {
                    onRestart()
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
                
                NavigationLink(destination: LotteryResultView()) {
                    HStack{
                        Text("Participar en Sorteo")
                            .foregroundColor(Color(hex: "#F2BC57"))
                            .underline()
                        Image(systemName:"arrowshape.forward.circle.fill")
                            .foregroundColor(Color(hex: "#F2BC57"))
                    }
                }
            }
            .padding()
        }
    }
}
