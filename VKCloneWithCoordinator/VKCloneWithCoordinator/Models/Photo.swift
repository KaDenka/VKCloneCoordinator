//
//  Photo.swift
//  SwiftUIVK
//
//  Created by Denis Kazarin on 08.11.2021.
//

import Foundation

// MARK: - PhotosCollection
struct PhotosCollection: Codable {
    let response: PhotosResponse
}

// MARK: - Response
struct PhotosResponse: Codable {
    let count: Int
    let items: [PhotoItem]
}

// MARK: - Item
struct PhotoItem: Codable {
    let date: Int
    let photoDataItems: [SizesAndUrls]

    enum CodingKeys: String, CodingKey {
        case date
        case photoDataItems = "sizes"
    }
}

// MARK: - Size
struct SizesAndUrls: Codable {
    let url: String
}
