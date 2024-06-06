//
//  ApiClientError.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import Foundation

enum ApiClientError: Error {
    case network
    case service(Int)
    case empty
    case deserialize
    case request
    
    var localizedDescription: String {
        switch self {
        case .network:
            return "Network error occurred."
        case .service(let statusCode):
            return "Service error with status code: \(statusCode)"
        case .empty:
            return "No data received."
        case .deserialize:
            return "Failed to decode data."
        case .request:
            return "Failed to create request."
        }
    }
}
