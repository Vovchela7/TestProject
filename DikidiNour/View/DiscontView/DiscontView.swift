//
//  DiscontView.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct DiscontView: View {
    @EnvironmentObject private var mainViewModel: DikidiViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Акции")
                .bold()
                .font(.title2)
                .padding(.horizontal)
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(mainViewModel.shares, id: \.self.id) { card in
                        DiscontCell(card: card)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.bottom)
        .background(Color.green.opacity(0.12))
    }
}
