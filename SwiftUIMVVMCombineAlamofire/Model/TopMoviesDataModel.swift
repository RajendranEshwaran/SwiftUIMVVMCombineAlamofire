//
//  ModelData.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by Rajendran Eshwaran on 3/13/22.
//

import Foundation

struct TopMoviesDataModel: Decodable,Identifiable {
    var id = UUID()
    let items: [MovieItem]?
    let errorMessage: String?
    enum CodingKeys : String, CodingKey{
        case items,errorMessage
    }
}

// MARK: - Item
struct MovieItem: Decodable {
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


