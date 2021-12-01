//
//  FriendsView.swift
//  SwiftUIVK
//
//  Created by Denis Kazarin on 29.10.2021.
//

import SwiftUI
import SystemConfiguration

struct FriendsView: View {
    
    @ObservedObject var model: FriendsViewModel
    
    @State private var shouldShowPhotoCollection = false
    
    init(model: FriendsViewModel) {
        self.model = model
    }
    
    var body: some View {
        NavigationView {
            List(model.friends) { friend in
                FriendCell(friend: friend, isPhotoButtonSelected: $shouldShowPhotoCollection)
            }.navigationBarTitle(Text("Friends"))
        }
       
        .onAppear {
            model.friendsRequest()
        }
    }
}

