//
//  FavoritesCell.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct FavoritesSectionCell: View {
    let card: Catalog
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: card.image.thumb)) { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
            } placeholder: {
                ProgressView()
                    .frame(width: 55, height: 55)
            }
            .cornerRadius(10)
            Text(card.name)
                .font(.caption)
                .frame(width: 80, height: 33)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
    }
}


