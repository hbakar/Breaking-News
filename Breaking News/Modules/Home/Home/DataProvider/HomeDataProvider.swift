//
//  HomeDataProvider.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 28.07.2025.
//

import Foundation

final class HomeDataProvider: HomeDataProviderProtocol {
    
    func fetchEverything(endpoint: NewsEndpoint, completion: @escaping (Result<NewsResponse, Error>) -> ()) {
           ServiceManager.shared.fetch(endpoint, completion: completion)
       }
       
       func fetchTopHeadlines(endpoint: NewsEndpoint, completion: @escaping (Result<NewsResponse, Error>) -> ()) {
           ServiceManager.shared.fetch(endpoint, completion: completion)
       }
       
       func fetchSources(endpoint: NewsEndpoint, completion: @escaping (Result<Source, Error>) -> ()) {
           ServiceManager.shared.fetch(endpoint, completion: completion)
       }
}
