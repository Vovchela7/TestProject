//
//  DikidiViewModel.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//
import Foundation
import Combine

final class DikidiViewModel: ObservableObject {
    let dikidiService: DikidiServiceProtocol
    let locationService: LocationServiceProtocol
    @Published var responseModel: ResponseModel? = nil
    @Published var shares: [ShareItem] = []
    @Published var catalog: [Catalog] = []
    @Published var highRatingCompanies: [Catalog] = []
    @Published var examples: String? = ""
    @Published var examples2: String = ""
    @Published var isLoading: Bool = true
    @Published var vip: [Catalog] = []
    @Published var error: ErrorStruct?
    @Published var hasFetchedData = false
    @Published var locationText: String = "Ярославль (Ярославская область)"
    
    private let cityID = 468902
    
    init(
        dikidiService: DikidiServiceProtocol,
        locationService: LocationServiceProtocol
    ) {
        self.dikidiService = dikidiService
        self.locationService = locationService
        setupLocationService()
    }

    func requestLocation() {
        locationService.requestLocation()
    }
    
    func onAppear() {
        guard !hasFetchedData else { return }
        hasFetchedData = true
        dikidiService.fetchDikidiData(cityID: cityID) { [weak self] result in
            DispatchQueue.main.async {
                self?.handleFetchResult(result)
            }
        }
    }
    
    func formattedDateString(from dateStr: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = formatter.date(from: dateStr) else {
            return "Неверный формат даты"
        }
        
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        let monthNames = [
            "января", "февраля", "марта", "апреля", "мая", "июня",
            "июля", "августа", "сентября", "октября", "ноября", "декабря"
        ]
        
        guard month > 0 && month <= 12 else {
            return "Неверный месяц"
        }
        
        return "До \(day) \(monthNames[month - 1])"
    }
}

private extension DikidiViewModel {
    
     func setupLocationService() {
        locationService.onLocationDetermined = { [weak self] location in
            DispatchQueue.main.async {
                self?.locationText = location
            }
        }
    }
    
    func handleFetchResult(_ result: Result<ResponseModel, ApiClientError>) {
        switch result {
        case .success(let response):
            self.responseModel = response
            self.shares = response.data.blocks.shares.list
            self.catalog = response.data.blocks.catalog
            self.examples = response.data.blocks.examples
            self.examples2 = response.data.blocks.examples2
            self.vip = response.data.blocks.catalog.filter { $0.vipTariff }
            self.filterHighRatingCompanies()
            self.isLoading = false
        case .failure(let error):
            self.isLoading = false
            print("Error fetching data: \(error)")
        }
    }
    
    func filterHighRatingCompanies() {
        highRatingCompanies = catalog.filter { $0.rating > 4 }
    }
}
