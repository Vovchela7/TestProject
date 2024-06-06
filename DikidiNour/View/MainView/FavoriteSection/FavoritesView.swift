//
//  FavoritesView.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct FavoritesSection: View {
    @EnvironmentObject var viewModel: DikidiViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Избранное")
                    .bold()
                Text("\(viewModel.catalog.count)")
                    .foregroundColor(.secondary)
            }
            .font(.title2)
            .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    Spacer()
                        .frame(width: 10)
                    ForEach(viewModel.catalog, id: \.self.id) { card in
                        FavoritesSectionCell(card: card)
                    }
                }
            }
        }
        .padding(.vertical)
    }
}

