//
//  ImageBuilder.swift
//  SwiftUIVK
//
//  Created by Denis Kazarin on 29.10.2021.
//

import SwiftUI

struct ImageBuilder: View {
    @State var isScaleChanged: Bool = false
    
    let content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    var body: some View {
            content
                .resizable()
                .frame(width: 50, height: 50)
                .modifier(ImageModifier(imageCornerRadius: 40, shadowColor: .black, shadowRadius: 5, x: 3, y: 3))
        }
}
