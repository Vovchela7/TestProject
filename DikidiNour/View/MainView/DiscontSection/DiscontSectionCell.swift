//
//  DiscontCell.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//
import SwiftUI

struct DiscontSectionCell: View {
    @EnvironmentObject private var mainViewModel: DikidiViewModel
    let card: ShareItem
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(card.name)
                    
                    HStack {
                        AsyncImage(url: URL(string: card.companyImage)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 40, height: 40)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(10)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.gray)
                                    .cornerRadius(10)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(card.name)
                                .font(.callout)
                            Text("\(card.companyStreet) \(card.companyHouse)")
                                .foregroundColor(.secondary)
                                .font(.caption)
                                .lineLimit(1)
                        }
                    }
                }
                .padding()
            }
            
            AsyncImage(url: URL(string: card.icon)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 300, height: 140)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            .overlay(alignment: .topLeading) {
                Text("\(card.discountValue) %")
                    .foregroundColor(.white)
                    .font(.caption)
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .fill(Color.red)
                            .frame(height: 20)
                    )
                    .offset(x: 10, y: 10)
            }
            .overlay(alignment: .bottomLeading) {
                Text(mainViewModel.formattedDateString(from: card.timeStop))
                    .font(.caption)
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .fill(Color.white.opacity(0.6))
                            .frame(height: 20)
                    )
                    .offset(x: 10, y: -10)
            }
            .overlay(alignment: .bottomTrailing) {
                HStack(spacing: 4) {
                    Image(systemName: "eye")
                    Text(card.view)
                }
                .font(.caption)
                .padding(.horizontal, 10)
                .background(
                    Capsule()
                        .fill(Color.white.opacity(0.6))
                        .frame(height: 20)
                )
                .offset(x: -10, y: -10)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(width: 300, height: 280)
    }
}
