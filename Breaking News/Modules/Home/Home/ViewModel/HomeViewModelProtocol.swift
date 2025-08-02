//
//  HomeViewModelProtocol.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 28.07.2025.
//

import Foundation

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? {get set}
    var sectionTitles: [String] {get set}
    var homeCollectionItems: [HomeCollectionItems] {get set}
    var topHeadlineResponse: NewsResponse? {get set}
    var everythingResponse: NewsResponse? {get set}
    var sourceResponse: Source? {get set}
    
    func getTopHeadlines(endpoint: NewsEndpoint)
    func getEverything(endpoint: NewsEndpoint)
    func getSources(endpoint: NewsEndpoint)
}
