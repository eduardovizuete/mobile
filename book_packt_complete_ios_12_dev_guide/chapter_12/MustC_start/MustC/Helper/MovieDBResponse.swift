//
//  MovieDBResponse.swift
//  MustC
//
//  Created by eduardo on 5/16/19.
//

struct MovieDBLookupResponse: Codable {
  struct MovieDBMovie: Codable {
    let popularity: Double?
  }
  
  let results: [MovieDBMovie]
}
