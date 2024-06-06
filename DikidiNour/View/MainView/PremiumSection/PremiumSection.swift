//
//  PremiumView.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct PremiumSection: View {
    @EnvironmentObject private var viewModel: DikidiViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Премиум")
                    .bold()
                Text("\(viewModel.vip.count)")
                    .foregroundColor(.secondary)
            }
            .font(.title2)
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                VStack {
                    ForEach(viewModel.vip, id: \.id) { card in
                        PremiumSectionCell(card: card)
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
