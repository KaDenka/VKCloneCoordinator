//
//  FriendsViewModel.swift
//  VKCloneWithCoordinator
//
//  Created by Denis Kazarin on 27.11.2021.
//

import SwiftUI

class FriendsViewModel: ObservableObject {
    @Published var friends: [Friend] = []
    let api: VKAPIService
    
    init(_ api: VKAPIService) {
        self.api = api
    }
    
    public func friendsRequest() {
        api.friendsListRequest { [weak self] friends in
            guard let self = self else { return }
            self.friends = friends!.response.items
        }
    }
}
