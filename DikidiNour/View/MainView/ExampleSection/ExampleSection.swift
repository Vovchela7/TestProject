//
//  ExamplesView.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//
import SwiftUI

struct ExamplesSection: View {
    @EnvironmentObject private var mainViewModel: DikidiViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Примеры работ")
                    .bold()
                Spacer()
            }
            .font(.title2)
            AsyncImage(url: URL(string: mainViewModel.examples)) { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
            }
            .cornerRadius(15)
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.accentColor, lineWidth: 1)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(.white)
                Text("Посмотреть фото")
                    .bold()
                    .foregroundColor(.accentColor)
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}
