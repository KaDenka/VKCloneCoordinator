//
//  GroupsViewModel.swift
//  VKCloneWithCoordinator
//
//  Created by Denis Kazarin on 27.11.2021.
//

import SwiftUI

class GroupsViewModel: ObservableObject {
    
    @Published var groups: [Group] = []
    
    let api: VKAPIService
    
    init(_ api: VKAPIService) {
        self.api = api
    }
    
    public func groupsRequest() {
        api.groupsListRequest { [weak self] groups in
            guard let self = self else { return }
            self.groups = groups!.response.items
        }
    }
}
