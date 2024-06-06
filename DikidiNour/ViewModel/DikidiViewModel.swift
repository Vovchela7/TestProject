//
//  MainViewModel.swift
//  DikidiNour
//
//  Created by Vovchela10 on 04.06.2024.
//
import SwiftUI

class DikidiViewModel: ObservableObject {
    let dikidiService: DikidiServiceProtocol
    @Published var responseModel: ResponseModel? = nil
    @Published var shares: [ShareItem] = []
    @Published var catalog: [Catalog] = []
    @Published var examples: String = ""
    @Published var examples2: String = ""
    @Published var isLoading: Bool = false
    @Published var error: ErrorStruct?

    init(dikidiService: DikidiServiceProtocol) {
        self.dikidiService = dikidiService
    }

    func fetchDikidiData() {
        self.isLoading = true
        dikidiService.fetchDikidiData { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.responseModel = response
                    self?.shares = response.data.blocks.shares.list
                    self?.catalog = response.data.blocks.catalog
                    self?.examples = response.data.blocks.examples
                    self?.examples2 = response.data.blocks.examples2
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }
        }
    }
}
