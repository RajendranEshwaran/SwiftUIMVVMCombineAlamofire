//
//  URLExtension.swift
//  SwiftUIMVVMCombineAlamofire
//
//  Created by gomathi saminathan on 3/14/22.
//

import Foundation

extension URL{
    static func getMoviesUrl()->URL?
    {
        guard let url = URL(string: "https://imdb-api.com/en/API/Top250Movies/k_p6xx9arv") else {return nil}
        return url
    }
    // https://imdb-api.com/en/API/Top250TVs/k_p6xx9arv
}
