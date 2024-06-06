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
            HStack {
                Text("Акции")
                    .bold()
                    .font(.title2)
                Text("14")
                    .foregroundColor(.secondary)
                    .font(.title2)
                Spacer()
                Text("См. все")
                    .foregroundColor(.accentColor)
            }
            .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    Spacer()
                        .frame(width: 10)
                    ForEach(mainViewModel.shares, id: \.self.id) { card in
DiscontCell(card: card)                    }
                }
            }
        }
        .padding(.bottom)
    }
}

