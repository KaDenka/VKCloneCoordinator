//
//  PhotoViewModel.swift
//  VKCloneWithCoordinator
//
//  Created by Denis Kazarin on 01.12.2021.
//

import SwiftUI

class PhotoViewModel: ObservableObject {
    var photoItems: [PhotoItem] = []
    var photoStringURLs: [String] = []
    @Published var photos: [UIImage] = []
    
    
    let api: VKAPIService
    
    init(_ api: VKAPIService) {
        self.api = api
    }
    
    public func photoRequest() {
        api.photosCollectionRequest { [weak self] photos in
            guard let self = self else { return }
            self.photoItems = photos!.response.items
        }
        
        for photoItem in photoItems {
            let items = photoItem.photoDataItems
            for item in items {
                let url = item.url
                photoStringURLs.append(url)
            }
        }
        
        photos = ImageLoader().getPhotoCollection(photoStringURLs)
    }
}
