//
//  PhotoCell.swift
//  VKCloneWithCoordinator
//
//  Created by Denis Kazarin on 01.12.2021.
//

import SwiftUI

struct PhotoCell: View {
    
    let photo: UIImage
    
    init(photo: UIImage) {
        self.photo = photo
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack{
                Image(uiImage: photo)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            
        }
    }
}
