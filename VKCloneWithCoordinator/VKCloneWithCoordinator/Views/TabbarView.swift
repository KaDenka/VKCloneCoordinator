//
//  TabbarView.swift
//  VKCloneWithCoordinator
//
//  Created by Denis Kazarin on 27.11.2021.
//

import SwiftUI

struct TabbarView: View {
    
    var model: LoginModel
    
    var body: some View {
        TabView {
            FriendsView(model: FriendsViewModel(VKAPIService(loginModel: model)))
                .navigationBarTitle("Friends", displayMode: .inline)
                .tabItem {
                    Label("Friends", systemImage: "person.3")
                }
                .tag(1)
            
            GroupsView(model: GroupsViewModel(VKAPIService(loginModel: model)))
                .navigationBarTitle("Groups", displayMode: .inline)
                .tabItem {
                    Label("Groups", systemImage: "squares.below.rectangle")
                }
                .tag(2)
            
            NewsView(model: NewsViewModel(VKAPIService(loginModel: model)))
                .navigationBarTitle("News", displayMode: .inline)
                .tabItem {
                    Label("News", systemImage: "list.bullet")
                }
                .tag(3)
            PhotoView(model: PhotoViewModel(VKAPIService(loginModel: model)))
                .navigationBarTitle("Photos", displayMode: .inline)
                .tabItem {
                    Label("Photos", systemImage: "photo")
                }
                .tag(4)
        }.navigationBarBackButtonHidden(true)
    }
}
