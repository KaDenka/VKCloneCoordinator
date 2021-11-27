//
//  PhotoCollectionView.swift
//  SwiftUIVK
//
//  Created by Denis Kazarin on 02.11.2021.
//

import SwiftUI

struct PhotoCollectionView: View {
    
    var body: some View {
        
        NavigationView {
            
           Text("Sorry, it's under construction now!")

        .navigationBarTitle(Text("Photos"))
        }
        
    }
    
   
}


struct PhotoCell: View {
    
    let photo: UIImage
    
    var body: some View {
        
        HStack {
            Image(uiImage: photo)
        }
    }
}

struct PhotoCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCollectionView()
    }
}
