//
//  PhotoCell.swift
//  VKCloneWithCoordinator
//
//  Created by Denis Kazarin on 01.12.2021.
//

import SwiftUI

struct PhotoCell: View {
    
    let photo: UIImage
    
    var body: some View {
        Image(uiImage: photo)
           
    }
}
