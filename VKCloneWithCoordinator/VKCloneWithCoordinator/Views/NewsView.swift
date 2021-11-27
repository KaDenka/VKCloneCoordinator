//
//  NewsView.swift
//  SwiftUIVK
//
//  Created by Denis Kazarin on 02.11.2021.
//

import SwiftUI

struct NewsView: View {
    
  
    @ObservedObject var model: NewsViewModel
    
    init(model: NewsViewModel) {
        self.model = model
    }
    
    var body: some View {
        
        NavigationView {
            List(model.news) { newsItem in
                NewsCell(news: newsItem)
            }.navigationBarTitle(Text("News"))
        }
        .onAppear {
            model.newsRequest()
        }
        
    }
}
