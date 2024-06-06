//
//  CatalogSectionCell.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct CatalogSectionCell: View {
    let card: Catalog
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: card.image.thumb)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 120)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 120)
                        .clipped()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .foregroundColor(.gray)
                        .clipped()
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(card.name)
                    .font(.headline)
                    .lineLimit(1)
                Text("\(card.street) \(card.house)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                HStack {
                    Text(String(format: "%.1f", card.rating))
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    StarRating(rating: card.rating)
                }
            }
            .padding([.leading, .bottom, .trailing])
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 150) 
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
