//
//  MovieDBHelper.swift
//  MustC
//
//  Created by eduardo on 5/16/19.
//
import Foundation

struct MovieDBHelper {
  typealias MovieDBCallback = (Int?, Double?) -> Void
  let apiKey = "2fee47b9446ff1a3d510af542f37544e"
  
  func fetchRating(forMovie movie: String, callback: @escaping MovieDBCallback) {
    guard let searchUrl = url(forMovie: movie) else {
      callback(nil, nil)
      return
    }
    
    let task = URLSession.shared.dataTask(with: searchUrl) { data, response, error in
      var rating: Double? = nil
      var remoteId: Int? = nil
      
      defer {
        callback(remoteId, rating)
      }
      
      let decoder = JSONDecoder()
      
      guard error == nil,
        let data = data,
        let lookupResponse = try? decoder.decode(MovieDBLookupResponse.self, from: data),
        let movie = lookupResponse.results.first
        else { return }
      
      rating = movie.popularity
      remoteId = movie.id
    }
    
    task.resume()
  }
  
  private func url(forMovie movie: String) -> URL? {
    guard let query = movie.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
      else { return nil }
    
    var urlString = "https://api.themoviedb.org/3/search/movie/"
    urlString = urlString.appending("?api_key=\(apiKey)")
    urlString = urlString.appending("&query=\(query)")
    
    return URL(string: urlString)
  }
}
