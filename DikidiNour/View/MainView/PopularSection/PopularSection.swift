//
//  PopularSection.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct PopularSection: View {
    @EnvironmentObject private var mainViewModel: DikidiViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Популярное")
                    .bold()
                Text("\(mainViewModel.highRatingCompanies.count)")
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            .font(.title2)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(mainViewModel.highRatingCompanies, id: \.self.id) { card in
                        PopularSectionCell(card: card)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .padding(.bottom)
    }
}
