//
//  DikidiRequestService.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import Foundation

protocol DikidiRequestServiceProtocol: AnyObject {
    func dikidiRequest(cityID: Int) -> URLRequest?
}

final class DikidiRequestService: DikidiRequestServiceProtocol {
    private let baseURL = "https://api-beauty.test.dikidi.ru/home/info"
    private let apiKey = "maJ9RyT4TJLt7bmvYXU7M3h4F797fUKofUf3373foN94q4peAM"
    
    private enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    func dikidiRequest(cityID: Int) -> URLRequest? {
        guard let url = URL(string: baseURL) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        
        let parameters: [String: Any] = [
            "city_id": cityID
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            print("Error serializing JSON: \(error)")
            return nil
        }
        
        return request
    }
}
