//
//  DataModel.swift
//  SpaceNews
//
//  Created by Abdullah Karaboğa on 2.04.2023.
//

import Foundation

struct NewsApi: Codable {
    let id: Int
    let title: String
    let imageUrl: String
    let summary: String
    let url: String
}
