//
//  NewsCell.swift
//  VKCloneWithCoordinator
//
//  Created by Denis Kazarin on 27.11.2021.
//

import SwiftUI

struct NewsCell: View {
    
    let news: ResponseItem
    
    var body: some View {
    
            VStack(alignment: .leading) {
                Text(DateLoader().transformDateFormat(news.id))
                    .font(.subheadline)
                    .foregroundColor(.black)
                if let text = news.text {
                    Text(text)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }.padding(.leading, 30)
            
        }
    }
