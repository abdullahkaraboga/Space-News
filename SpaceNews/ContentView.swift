//
//  ContentView.swift
//  SpaceNews
//
//  Created by Abdullah Karaboğa on 2.04.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {

        NavigationView {
            List {
                ForEach(viewModel.news, id: \.id) { news in
                    VStack {
                        AsyncImage(url: URL(string: news.imageUrl)) { Image in
                            Image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 350, height: 200)
                                .cornerRadius(10)
                        } placeholder: { ProgressView() }
                        VStack (alignment: .leading, spacing: 4) {
                            Text(news.title)
                                .padding(.bottom, 8)
                                .foregroundColor(.black)
                                .font(.title3)
                                .fontWeight(.bold)

                            Text(news.summary)
                                .foregroundColor(.gray)
                                .font(.callout)
                                .fontWeight(.bold)
                        }
                    }
                }
            }.listStyle(InsetListStyle())
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
