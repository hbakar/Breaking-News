//
//  NewsResponse.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 29.07.2025.
//

import Foundation

struct NewsResponse: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

struct Article: Decodable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: Date?
    let content: String?
}

struct Source: Decodable {
    let id: String?
    let name: String?
}
