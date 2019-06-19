//
//  CharacterSpec.swift
//  MarvelTests
//
//  Created by Gilberto VIZUETE SALAZAR on 6/19/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Quick
import Nimble
@testable import marvelapp_start

class CharacterSpec: QuickSpec {

  override func spec() {
    describe("a character") {
      
      var character: marvelapp_start.Character!
      
      beforeEach {
        let testBundle = Bundle(for: type(of: self))
        let mockLoader = MockLoader(file: "character", in: testBundle)
        character = mockLoader?.map(to: Character.self)
      }
      
      it("should be able to create a character from json") {
        expect(character).toNot(beNil())
      }
      
      it("should have a thumbImage") {
        expect(character.thumbImage).toNot(beNil())
      }
      
    }
  }
  
}
