//
//  PopularSectionCell.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct PopularSectionCell: View {
    let card: Catalog
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: card.image.thumb)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 80, height: 80)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(card.name)
                    .lineLimit(1)
                Text("\(card.street) \(card.house)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                HStack {
                    Text("\(card.rating, specifier: "%.1f")")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    StarRating(rating: card.rating)
                }
            }
            Spacer()
        }
        .frame(width: 290)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}
