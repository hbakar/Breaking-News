//
//  Extension+URL.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 1.08.2025.
//

import Foundation

extension URL {
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else {
            return nil
        }
        
        var parameters = [String: String]()
        for queryItem in queryItems {
            parameters[queryItem.name] = queryItem.value
        }
        return parameters
    }
}
