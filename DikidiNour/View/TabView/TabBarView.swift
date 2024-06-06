//
//  TabBarView.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Tabs = .main
    @EnvironmentObject var viewModel: DikidiViewModel
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(Tabs.allCases, id: \.self) { tab in
                NavigationView {
                    switch tab {
                    case .main:
                        DikidiView(viewModel: viewModel)
                    case .catalog:
                        CatalogSection()
                            .environmentObject(viewModel)
                    case .promotions:
                        DiscontView()
                    case .myNotes:
                        AuthorizationView()
                    case .more:
                        ProfileView()
                    }
                }
                .tabItem {
                    Image(systemName: tab.image)
                    Text(tab.title)
                }
                .tag(tab)
            }
        }
    }
}

enum Tabs: CaseIterable, Hashable {
    case main
    case catalog
    case promotions
    case myNotes
    case more
    
    var image: String {
        switch self {
        case .main:
            return "house"
        case .catalog:
            return "square.stack"
        case .promotions:
            return "seal"
        case .myNotes:
            return "book"
        case .more:
            return "line.3.horizontal"
        }
    }
    
    var title: String {
        switch self {
        case .main:
            return "Главная"
        case .catalog:
            return "Каталог"
        case .promotions:
            return "Акции"
        case .myNotes:
            return "Мои записи"
        case .more:
            return "Еще"
        }
    }
}
