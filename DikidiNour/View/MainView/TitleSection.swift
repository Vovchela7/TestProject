//
//  TitleSection.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import Foundation
import SwiftUI

struct TitleSection: View {
    @EnvironmentObject var viewModel: DikidiViewModel

    var body: some View {
        ZStack {
            Color.blue
            VStack {
                Text("Главная")
                    .padding(.top, 35)
                    .font(.callout)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 1)
                HStack(spacing: 2) {
                    Text(viewModel.locationText)
                        .font(.caption)
                    Image(systemName: "chevron.right")
                        .font(.caption2)
                }
                .padding(.bottom, 6)
                HStack(spacing: 15) {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10)
                            .opacity(0.18)
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Text("Услуга, специалист или компания")
                        }
                        .font(.caption)
                        .padding(.horizontal)
                    }
                    .frame(height: 40)
                    Image("Geo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            viewModel.requestLocation()
                        }
                }
            }
            .padding()
            .foregroundColor(.white)
        }
        .ignoresSafeArea(edges: .top)
        .frame(height: 100)
    }
}
