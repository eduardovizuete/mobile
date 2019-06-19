//
//  ThumbImageSpec.swift
//  MarvelTests
//
//  Created by Gilberto VIZUETE SALAZAR on 6/19/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import marvelapp_start

class ThumbImageSpec: QuickSpec {
  override func spec() {
    describe("a thumbImage") {
      
      var thumbImage = ThumbImage()
      
      it("should be able to create a character from json") {
        thumbImage.imageExtension = "png"
        thumbImage.path = "whatever"
        expect(thumbImage.fullPath()).to(equal("whatever.png"))
      }
    }
  }

  

}
