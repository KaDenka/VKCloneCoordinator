//
//  GroupCell.swift
//  VKCloneWithCoordinator
//
//  Created by Denis Kazarin on 27.11.2021.
//

import SwiftUI

struct GroupCell: View {
    let group: Group
    @State private var wasButtonPressed: Bool = false
    private var imageState: String {
        if wasButtonPressed {
            return "heart.fill"
        } else {
            return "heart"
        }
    }
     var wasLiked: Int {
        if wasButtonPressed {
            return 1
        } else {
            return 0
        }
    }
     var totalLikes: Int = 100
    
    var body: some View {
        HStack {
            VStack {
                ImageBuilder {
                    Image(uiImage: ImageLoader().getImage(group.photo50))
                }
                Text("\(totalLikes + wasLiked)")
                    .font(.footnote)
                    .foregroundColor(.red)
                Button{
                    wasButtonPressed.toggle()
                }label: {
                    Image(systemName: imageState)
                        .foregroundColor(.red)
                }
            }
            VStack(alignment: .leading) {
                Text("\(group.name)")
                    .font(.subheadline)
                    .foregroundColor(.black)
                Text("\(group.screenName)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("\(group.itemDescription)")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .lineLimit(2)
            }
            .padding(.leading, 30)
            
        }
    }
}
