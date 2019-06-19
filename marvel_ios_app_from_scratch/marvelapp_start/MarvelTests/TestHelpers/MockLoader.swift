//
//  MockLoader.swift
//  MarvelTests
//
//  Created by Gilberto VIZUETE SALAZAR on 6/19/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Foundation
import ObjectMapper
@testable import marvelapp_start

struct MockLoader {
  
  private let data: Data
  private let json: String
  
  init?(file: String, withExtension fileExt: String = "json", in bundle: Bundle = Bundle.main) {
    guard let path = bundle.path(forResource: file, ofType: fileExt) else {
      return nil
    }
    let pathURL = URL(fileURLWithPath: path)
    do {
      data = try Data(contentsOf: pathURL, options: .dataReadingMapped)
      if let decoded = NSString(data: data, encoding: 0) as? String {
        json = decoded
      } else {
        return nil
      }
    } catch {
      return nil
    }
  }
  
  func map<T: Mappable>(to type: T.Type) -> T? {
    return Mapper<T>().map(JSONString: json)
  }
  
}

