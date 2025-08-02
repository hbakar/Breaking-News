//
//  ServiceManager.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 27.07.2025.
//

import Foundation

final class ServiceManager {
    
    static let shared = ServiceManager()
    private init() { }
    
    func fetch<T: Decodable>(_ endpoint: NewsEndpoint, completion: @escaping(Result<T, Error>) ->()) {
        let request = endpoint.request()
            
        print("DEBUG URL: \(request.url?.absoluteString ?? "URL oluşturulamadı")")
            let task = URLSession.shared.dataTask(with: request)  { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
             decoder.dateDecodingStrategy = .iso8601
                do {
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(NSError(domain: "Invalid JSON", code: 0)))
                }
            }
            else {
                completion(.failure(NSError(domain: "No data returned", code: 0)))
                return
            }
        }
        task.resume()
    }
}
