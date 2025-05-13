//
//  InfoCard.swift
//  CorosHack_Athon
//
//  Created by Alejandro  on 13/05/25.
//

import SwiftUI

struct InfoCard: View {
    var iconName: String
    var title: String
    var description: String
    var backgroundColor: Color = Color(UIColor.secondarySystemBackground)
    var imageBackground: Color = .white
    var height: CGFloat? = nil // Optional height

    var isDarkBackground: Bool {
        backgroundColor == .teal || backgroundColor == .purple
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(8)
                .background(
                    Circle()
                        .fill(isDarkBackground ? Color.white.opacity(0.2) : imageBackground)
                )

            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(isDarkBackground ? .white : .black)

            Text(description)
                .font(.subheadline)
                .foregroundColor(isDarkBackground ? .white.opacity(0.9) : .black.opacity(0.7))
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: height, maxHeight: height, alignment: .topLeading) // 👈 height here
        .background(backgroundColor)
        .cornerRadius(20)
    }
}
