//
//  MarvelAPI.swift
//  marvelapp_start
//
//  Created by eduardo on 5/28/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Foundation
import Moya
import CryptoSwift
import Dollar
import Keys

fileprivate struct MarvelAPIConfig {
  fileprivate static let keys = MarvelKeys()
  static let privatekey = keys.marvelPrivateKey
  static let apikey = keys.marvelApiKey
  static let ts = Date().timeIntervalSince1970.description
  static let hash = "\(ts)\(privatekey)\(apikey)".md5()
}

enum MarvelAPI {
  case characters(String?)
  case character(String)
}

extension MarvelAPI: TargetType {
  // the destination url
  var baseURL: URL { return URL(string: "https://gateway.marvel.com:443")! }
  
  // the path to be added to baseURL to form the complete url
  var path: String {
    switch self {
    case .characters:
      return "/v1/public/characters"
    case .character(let characterId):
      return "/v1/public/characters/\(characterId)"
    }
  }
  
  // http method used in the request
  var method: Moya.Method {
    switch self {
    case .characters, .character:
      return .get
    }
  }
  
  // parameters to be encoded in the request
  var parameters: [String: Any]? {
    let authParams = ["apikey": MarvelAPIConfig.apikey,
                      "ts": MarvelAPIConfig.ts,
                      "hash": MarvelAPIConfig.hash]
    switch self {
    case .characters(let query):
      if let query = query {
        return Dollar.merge(authParams, ["nameStartsWith": query])
      }
      return authParams
    case .character(let characterId):
      return Dollar.merge(authParams, ["characterId": characterId])
    }
  }
  
  // type of http task to be performed
  var task: Task {
    return .requestPlain
  }
  
  // provides sample data for use in tests
  var sampleData: Data {
    switch self {
    default:
      return Data()
    }
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
  
}
