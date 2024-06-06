//
//  DikidiService.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import Foundation

protocol DikidiServiceProtocol: AnyObject {
    func fetchDikidiData(cityID: Int, 
                         completion: @escaping (Result<ResponseModel, ApiClientError>) -> Void)
}

final class DikidiService: DikidiServiceProtocol {
    private let networkService: NetworkServiceProtocol
    private let requestFactory: DikidiRequestServiceProtocol
    
    init(
        networkService: NetworkServiceProtocol,
        requestFactory: DikidiRequestServiceProtocol
    ) {
        self.networkService = networkService
        self.requestFactory = requestFactory
    }
    
    func fetchDikidiData(cityID: Int, 
                         completion: @escaping (Result<ResponseModel, ApiClientError>) -> Void) {
        guard let request = requestFactory.dikidiRequest(cityID: cityID) else {
            completion(.failure(.request))
            return
        }
        networkService.fetch(request: request) { (result: Result<ResponseModel, ApiClientError>) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
