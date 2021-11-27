//
//  NewsViewModel.swift
//  VKCloneWithCoordinator
//
//  Created by Denis Kazarin on 27.11.2021.
//

import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var news: [ResponseItem] = []
    let api: VKAPIService
    
    init(_ api: VKAPIService) {
        self.api = api
    }
    
    public func newsRequest() {
        api.newsFeedRequest { [weak self] news in
            guard let self = self else { return }
            self.news = news!.response.items
        }
    }
}
