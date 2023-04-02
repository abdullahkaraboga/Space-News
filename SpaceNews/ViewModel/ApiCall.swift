//
//  ApiCall.swift
//  SpaceNews
//
//  Created by Abdullah Karaboğa on 2.04.2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var news: [NewsApi] = []
    @Published var url = "https://api.spaceflightnewsapi.net/v3/articles"


    func fetchData () {

        guard let url = URL(string: url) else { return }

        let task: Void = URLSession.shared.dataTask(with: url) {  data, _, error in

            guard let data = data, error == nil else { return }
            do {

                let news = try JSONDecoder().decode([NewsApi].self, from: data)
                DispatchQueue.main.async {
                    self.news = news
                    print(news)
                }

            } catch {
                print(error.localizedDescription)
            }

        }.resume()
    }
}
