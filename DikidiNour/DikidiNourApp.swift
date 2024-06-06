//
//  DikidiNourApp.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//
import SwiftUI

@main
struct DikidiNourApp: App {
    @StateObject private var mainViewModel = createViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(mainViewModel)
        }
    }
}

private func createViewModel() -> DikidiViewModel {
    let networkService = NetworkService()
    let requestFactory = DikidiRequestService()
    let dikidiService = DikidiService(networkService: networkService, 
                                      requestFactory: requestFactory)
    let locationService = LocationService()
    return DikidiViewModel(dikidiService: dikidiService, locationService: locationService)
}
