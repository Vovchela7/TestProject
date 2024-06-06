//
//  DikidiView.swift
//  DikidiNour
//
//  Created by Vovchela10 on 04.06.2024.
//
import SwiftUI

struct DikidiView: View {
    @StateObject private var viewModel: DikidiViewModel
    
    init(viewModel: DikidiViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5, anchor: .center)
                } else {
                    TitleSection()
                    ScrollView {
                        PopularSection()
                        PremiumSection()
                        DiscontSectionView()
                        ExamplesSection()
                    }
                    .background(Color.green.opacity(0.08))
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.onAppear()
            }
            .environmentObject(viewModel)
        }
    }
}

