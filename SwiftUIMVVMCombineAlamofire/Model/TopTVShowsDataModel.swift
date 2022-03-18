//
//  TopTVShowsDataModel.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by Rajendran Eshwaran on 3/14/22.
//

import Foundation

struct TopTVShowsDataModel: Decodable,Identifiable {
    var id = UUID()
    let items: [TVItem]?
    let errorMessage: String?
    enum CodingKeys : String, CodingKey{
        case errorMessage, items
    }
}

// MARK: - Item
struct TVItem: Codable {
    let ids, rank, title, fullTitle: String?
    let year: String?
    let image: String?
    let crew, imDBRating, imDBRatingCount: String?

    enum CodingKeys: String, CodingKey {
        case ids = "id", rank, title, fullTitle, year, image, crew
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
    }
}
