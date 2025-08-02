//
//  HomeViewModel.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 28.07.2025.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    weak var delegate: HomeViewModelDelegate?
    var sectionTitles = [String]()
    var homeCollectionItems : [HomeCollectionItems] = []
    var topHeadlineResponse: NewsResponse?
    var everythingResponse: NewsResponse?
    var sourceResponse: Source?
    private let service: HomeDataProviderProtocol
    
    init(service: HomeDataProviderProtocol) {
        self.service = service
    }
    
    func getTopHeadlines(endpoint: NewsEndpoint) {
        service.fetchTopHeadlines(endpoint: endpoint) { [weak self] response in
            switch response {
            case .success(let success):
                self?.topHeadlineResponse = success
                self?.homeCollectionItems.append(.topHeadlineTitleSection)
               // self?.homeCollectionItems.append(.topHeadlineSection)
                self?.delegate?.notify(.didFetchTopHeadlines)
            case .failure(let failure):
                self?.delegate?.notify(.fetchFailedTopHeadlines(failure))
            }
        }
    }

    func getEverything(endpoint: NewsEndpoint) {
        service.fetchEverything(endpoint: endpoint) { [weak self] response in
            switch response {
            case .success(let success):
                self?.everythingResponse = success
              //  self?.homeCollectionItems.append(.everythingSection)
                self?.delegate?.notify(.didFetchEverything)
            case .failure(let error):
                self?.delegate?.notify(.fetchEverythingFailed(error))
            }
        }
    }

    func getSources(endpoint: NewsEndpoint) {
        service.fetchSources(endpoint: endpoint) { [weak self] response in
            switch response {
            case .success(let success):
                self?.sourceResponse = success
             //   self?.homeCollectionItems.append(.sourceSection)
                self?.delegate?.notify(.didFetchSources)
            case .failure(let failure):
                self?.delegate?.notify(.fetchSourcesFailed(failure))
            }
        }
    }
}

protocol HomeViewModelDelegate: AnyObject {
    func notify(_ event: HomeViewModelEvents)
}

enum HomeViewModelEvents {
    case didFetchTopHeadlines
    case fetchFailedTopHeadlines(Error)
    case didFetchEverything
    case fetchEverythingFailed(Error)
    case didFetchSources
    case fetchSourcesFailed(Error)
}

enum HomeCollectionItems {
    case topHeadlineTitleSection
   // case sourceSection
  
   // case topHeadlineSection
   // case everythingSection
}
