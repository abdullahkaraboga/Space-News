//
//  NewsArticle.swift
//  SpaceNews
//
//  Created by Abdullah Karaboğa on 10.02.2023.
//

import SwiftUI
import CachedAsyncImage

struct NewsArticle: View {

    let title: String
    let imageURL: String
    let siteName: String
    let summary: String

    var body: some View {
        Text(siteName)
            .foregroundColor(.blue)
            .italic()

        HStack(alignment: .center) {
            CachedAsyncImage(url: URL(string: imageURL),
                             transaction: Transaction(animation: .easeInOut)) { phase in

                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .transition(.opacity)
                } else {
                    HStack {

                    }
                }

                Text(title)
                    .font(.headline)
                    .padding(8)

                Text(summary)
                    .lineLimit(6)
                    .font(.headline)
                    .padding(8)
            }
        }
    }
}

