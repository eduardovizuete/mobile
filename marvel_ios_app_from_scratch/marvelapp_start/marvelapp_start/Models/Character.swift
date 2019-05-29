//
//  Character.swift
//  marvelapp_start
//
//  Created by eduardo on 5/28/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Character {
  var id: Int = 0
  var name: String = ""
  var thumbImage: ThumbImage?
}

extension Character: Mappable {
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    id          <- map["id"]
    name        <- map["name"]
    thumbImage  <- map["thumbnail"]
  }
}
