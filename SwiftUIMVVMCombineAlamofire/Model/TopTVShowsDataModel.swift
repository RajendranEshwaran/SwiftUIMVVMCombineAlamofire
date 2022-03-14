//
//  TopTVShowsDataModel.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by gomathi saminathan on 3/14/22.
//

import Foundation

struct TopTVShowsDataModel: Codable {
    let items: [TVItem]?
    let errorMessage: String?
}

// MARK: - Item
struct TVItem: Codable {
    let id, rank, title, fullTitle: String?
    let year: String?
    let image: String?
    let crew, imDBRating, imDBRatingCount: String?

    enum CodingKeys: String, CodingKey {
        case id, rank, title, fullTitle, year, image, crew
        case imDBRating = "imDbRating"
        case imDBRatingCount = "imDbRatingCount"
    }
}
