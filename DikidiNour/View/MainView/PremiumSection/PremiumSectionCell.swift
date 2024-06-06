//
//  PremiumSectionCell.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct PremiumSectionCell: View {
    let card: Catalog
    
    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: card.image.thumb)) { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            } placeholder: {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            .cornerRadius(10)
            VStack(alignment: .leading, spacing: 5) {
                Text(card.name)
                    .font(.system(size: 14))
                    .lineLimit(1)
                Text(card.categories.first ?? "")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.accentColor)
                    .frame(width: 100, height: 30)
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(width: 98, height: 28)
                Text("Записаться")
                    .foregroundColor(.accentColor)
                    .font(.caption)
            }
        }
        .padding()
    }
}
