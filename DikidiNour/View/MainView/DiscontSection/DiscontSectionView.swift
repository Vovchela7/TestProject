//
//  DiscontView.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct DiscontSectionView: View {
    @EnvironmentObject private var mainViewModel: DikidiViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            header
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    Spacer().frame(width: 10)
                    ForEach(mainViewModel.shares, id: \.self.id) { card in
                        DiscontSectionCell(card: card)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .padding(.bottom)
    }
    
    private var header: some View {
        HStack {
            Text("Акции")
                .bold()
                .font(.title2)
            Text("\(mainViewModel.shares.count)")
                .foregroundColor(.secondary)
                .font(.title2)
            Spacer()
            Text("См. все")
                .foregroundColor(.accentColor)
        }
        .padding(.horizontal)
    }
}

