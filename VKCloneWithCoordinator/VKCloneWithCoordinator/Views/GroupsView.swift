//
//  GroupsView.swift
//  SwiftUIVK
//
//  Created by Denis Kazarin on 29.10.2021.
//

import SwiftUI
import UIKit

struct GroupsView: View {
    
    @ObservedObject var model: GroupsViewModel
    
    init(model: GroupsViewModel) {
        self.model = model
    }
    
    var body: some View {
        NavigationView{
            List(model.groups) { group in
                GroupCell(group: group)
            }.navigationBarTitle(Text("User Groups"))
        }
        .onAppear {
            model.groupsRequest()
        }
    }
}
