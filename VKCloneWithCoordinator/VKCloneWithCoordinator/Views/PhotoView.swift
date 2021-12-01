//
//  PhotoView.swift
//  SwiftUIVK
//
//  Created by Denis Kazarin on 02.11.2021.
//

import SwiftUI

struct PhotoView: View {
    
    @ObservedObject var model: PhotoViewModel
    
    init(model: PhotoViewModel) {
        self.model = model
    }
    
    var body: some View {
        NavigationView {
            List(model.photos) { photo in
                Image(uiImage: photo)
            }
                .navigationBarTitle(Text("Photos"))
        }
       
        .onAppear {
            model.photoRequest()
        }
    }
}


//struct PhotoCell: View {
//
//    let photo: UIImage
//
//    var body: some View {
//
//        HStack {
//            Image(uiImage: photo)
//        }
//    }
//}
//
