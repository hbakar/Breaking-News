import Foundation

protocol EndpointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    func request() -> URLRequest
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum NewsEndpoint {
    case topHeadlines(country: String, category: String?, page: Int)
    case everything(query: String, sortBy: String?, page: Int)
    case sources(category: String?, country: String?)
}

extension NewsEndpoint: EndpointProtocol {
    
    var baseURL: String { Constant.baseURL }
    
    var path: String {
        switch self {
        case .topHeadlines: return Constant.topHeadlines
        case .everything:   return Constant.everything
        case .sources:      return Constant.sources
        }
    }
    
    var method: HTTPMethod { .get }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .topHeadlines(let country, let category, let page):
            var items: [URLQueryItem] = [
                URLQueryItem(name: "apiKey", value: Constant.apiKey),
                URLQueryItem(name: "country", value: country),
                URLQueryItem(name: "page", value: String(page))
            ]
            if let category = category {
                items.append(URLQueryItem(name: "category", value: category))
            }
            return items
            
        case .everything(let query, let sortBy, let page):
            var items: [URLQueryItem] = [
                URLQueryItem(name: "apiKey", value: Constant.apiKey),
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "page", value: String(page))
            ]
            if let sortBy = sortBy {
                items.append(URLQueryItem(name: "sortBy", value: sortBy))
            }
            return items
            
        case .sources(let category, let country):
            var items: [URLQueryItem] = [
                URLQueryItem(name: "apiKey", value: Constant.apiKey)
            ]
            if let category = category {
                items.append(URLQueryItem(name: "category", value: category))
            }
            if let country = country {
                items.append(URLQueryItem(name: "country", value: country))
            }
            return items
        }
    }
    
    func request() -> URLRequest {
        var components = URLComponents(string: baseURL)!
        components.path = path
        components.queryItems = queryItems
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        return request
    }
}
