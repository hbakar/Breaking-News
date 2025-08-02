//
//  HomeDataProviderProtocol.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 28.07.2025.
//

import Foundation

protocol HomeDataProviderProtocol {
    func fetchEverything(endpoint: NewsEndpoint, completion: @escaping (Result<NewsResponse, Error>) -> ())
    
    func fetchTopHeadlines(endpoint: NewsEndpoint, completion: @escaping (Result<NewsResponse, Error>) -> ())
    
    func fetchSources(endpoint: NewsEndpoint, completion: @escaping (Result<Source, Error>) -> ())
}
