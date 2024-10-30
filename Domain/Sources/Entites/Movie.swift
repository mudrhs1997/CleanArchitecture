//
//  Movie.swift
//  Domain
//
//  Created by 정명곤 on 10/29/24.
//  Copyright © 2024 CleanArchitecture. All rights reserved.
//

import Foundation

struct MovieDataResponse: Decodable {
    let data: MovieResponse
}

struct MovieResponse: Codable {
  let movies: [Movie]
}

public struct Movie: Codable {
  public let title: String
  let large_cover_image: String?
}
