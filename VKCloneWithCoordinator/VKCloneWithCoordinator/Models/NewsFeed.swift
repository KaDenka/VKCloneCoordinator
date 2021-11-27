//
//  NewsFeed.swift
//  SwiftUIVK
//
//  Created by Denis Kazarin on 08.11.2021.
//

import Foundation

// MARK: - NewsList
struct NewsList: Codable {
    let response: NewsResponse
}

// MARK: - Response
struct NewsResponse: Codable {
    let items: [ResponseItem]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}


// MARK: - ResponseItem
struct ResponseItem: Codable, Identifiable {
   
    let id: Int
    let text: String?
  
    enum CodingKeys: String, CodingKey {
        case id = "date"
        case text
    }
}
