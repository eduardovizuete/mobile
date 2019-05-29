//
//  ThumbImage.swift
//  marvelapp_start
//
//  Created by eduardo on 5/29/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Foundation
import ObjectMapper

struct ThumbImage {
  var path: String = ""
  var imageExtension: String = ""
  
  func fullPath() -> String {
    return "\(path).\(imageExtension)"
  }
}

extension ThumbImage: Mappable {
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    path            <- map["path"]
    imageExtension  <- map["extension"]
  }
}
