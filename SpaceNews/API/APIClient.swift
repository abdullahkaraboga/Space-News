//
//  APIClient.swift
//  SpaceNews
//
//  Created by Abdullah Karaboğa on 10.02.2023.
//

// https://api.spaceflightnewsapi.net/v3/articles

import Foundation

struct SpaceData: Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var imageUrL: String
    var newsSite: String
    var summary: String
    var publishedAt: String
}

@MainActor class SpaceAPI: ObservableObject {
    @Published var news: [SpaceData] = []

    func getData() {
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles?_limit=10") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [SpaceData(id: 0, title: tempError, url: "Error", imageUrL: "Error", newsSite: "Error", summary: "Swipe Refresh", publishedAt: "Error")]
                }
                return
            }

            let spaceData = try! JSONDecoder().decode([SpaceData].self, from: data)

            DispatchQueue.main.async {

                self.news = spaceData
            }

        }.resume()
    }
}


