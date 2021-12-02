//
//  ImageLoader.swift
//  SwiftUIVK
//
//  Created by Denis Kazarin on 08.11.2021.
//

import Foundation
import UIKit

class ImageLoader {
    
    func getImage(_ imageURL: String) -> UIImage {
        if let data = try? Data(contentsOf: URL(string: imageURL)!) {
         return UIImage(data: data)!
        } else {
            return UIImage(named: "noImage")!
        }
    }
    
    func getPhotoCollection (_ photoCollection: [String]) -> [UIImage] {
        var uiImagesArray = [UIImage]()
        for photo in photoCollection {
            let image = self.getImage(photo)
            uiImagesArray.append(image)
        }
        return uiImagesArray
    }
}
