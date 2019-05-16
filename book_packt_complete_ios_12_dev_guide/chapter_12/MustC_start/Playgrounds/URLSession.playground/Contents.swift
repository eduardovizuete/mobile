import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// simple url session request
//let url = URL(string: "https://apple.com")!
//let task = URLSession.shared.dataTask(with: url) { data, response, error in
//  guard let data = data, error == nil
//    else { return }
  
//  let responseString = String(data: data, encoding: .utf8)
  
//  print("Data: \(data)")
//  print("Response: \(response)")
//  print("Response String: \(responseString)")
//  print ("Error: \(error)")
//}

//task.resume()

// JSON data structure response movie
struct MovieResponse: Codable {
  let results: [Movie]
}

struct Movie: Codable {
  let id: Int
  let title: String
  let popularity: Float
}

// custom url request
let api_key = "2fee47b9446ff1a3d510af542f37544e"
var urlString = "https://api.themoviedb.org/3/search/movie/"
urlString = urlString.appending("?api_key=\(api_key)")
urlString = urlString.appending("&query=Swift")

let movieURL = URL(string: urlString)!

var urlRequest = URLRequest(url: movieURL)
urlRequest.httpMethod = "GET"
urlRequest.setValue("aplication/json", forHTTPHeaderField: "Accept")

let movieTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
  //guard let data = data,
    // convert the raw data to json object
    //let json = try? JSONSerialization.jsonObject(with: data, options: []),
    // convert json any to dictionary
    //let jsonDict = json as? [String: AnyObject],
    // get array of results as dictionary
    //let resultArray = jsonDict["results"] as? [[String: Any]]
    //else { return }
  
  // accesss the first movie
  //let firstMovie = resultArray[0]
  //let movieTitle = firstMovie["title"] as! String
  //print("Title of first movie: \(movieTitle)")
  
  // convert data using json decoder and struct
  let decoder = JSONDecoder()
  guard let data = data,
    let movies = try? decoder.decode(MovieResponse.self, from: data)
    else { return }
  
  print(movies.results[0].title)
  
  //print("Data: \(data)")
  //print("Response: \(response)")
  //print("Response url request json: \(json)")
  //print ("Error: \(error)")
}

movieTask.resume()

