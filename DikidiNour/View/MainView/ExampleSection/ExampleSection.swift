//
//  ExampleSection.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//
import SwiftUI

struct ExamplesSection: View {
    @EnvironmentObject private var mainViewModel: DikidiViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            header
            
            if let examplesURL = mainViewModel.examples, let url = URL(string: examplesURL) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(15)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Text("Недействительный URL")
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal)
            }
            
            viewPhotosButton
        }
        .padding()
    }
    
    private var header: some View {
        HStack {
            Text("Примеры работ")
                .font(.title2)
                .bold()
            Spacer()
        }
    }
    
    private var viewPhotosButton: some View {
        Button(action: {
            print("Посмотреть фото нажато")
        }) {
            Text("Посмотреть фото")
                .bold()
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .foregroundColor(.white)
                .cornerRadius(15)
        }
    }
}
