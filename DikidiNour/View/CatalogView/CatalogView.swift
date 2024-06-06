//
//  CatalogView.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct CatalogSection: View {
    @EnvironmentObject private var mainViewModel: DikidiViewModel
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleSection()
            HStack {
                Text("Все компании")
                    .bold()
                Text("\(mainViewModel.catalog.count)")
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            .font(.title2)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(mainViewModel.catalog, id: \.self.id) { card in
                        CatalogSectionCell(card: card)
                            .frame(height: 200) 
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.bottom)
        .background(Color(.systemGroupedBackground))
    }
}
