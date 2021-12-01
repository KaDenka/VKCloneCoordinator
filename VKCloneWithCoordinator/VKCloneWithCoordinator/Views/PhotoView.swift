//
//  PhotoView.swift
//  SwiftUIVK
//
//  Created by Denis Kazarin on 02.11.2021.
//

import SwiftUI

struct PhotoView: View {
    
    @ObservedObject var model: PhotoViewModel
    
    let columns = [
        GridItem(.flexible(minimum: 50, maximum: .infinity)),
        GridItem(.flexible(minimum: 50, maximum: .infinity))
    ]
    
    init(model: PhotoViewModel) {
        self.model = model
    }
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 20, content: {
                        ForEach(model.photos) { photo in
                            PhotoCell(photo: photo)
                                .frame(height: geometry.size.width/2)
                        }
                    })
                }
                .onAppear {
                    model.photoRequest()
                }
            }
            .navigationBarTitle(Text("Photos"))
        }
    }
}


