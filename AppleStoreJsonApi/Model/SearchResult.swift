//
//  SearchResult.swift
//  AppleStoreJsonApi
//
//  Created by Victor Bruce on 17/07/2023.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
}
