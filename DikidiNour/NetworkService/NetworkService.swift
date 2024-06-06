//
//  NetworkService.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func fetch<T: Decodable>(request: URLRequest,
                             completion: @escaping  (Result<T, ApiClientError>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func fetch<T: Decodable>(request: URLRequest,
                             completion: @escaping (Result<T, ApiClientError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil, let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.network))
                return
            }
            
            guard let data = data else {
                completion(.failure(.empty))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.service(httpResponse.statusCode)))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                print("Deserialization error: \(error)")
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Failed to decode: \(jsonString)")
                }
                completion(.failure(.deserialize))
            }
        }
        dataTask.resume()
    }
}
