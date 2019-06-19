//
//  CharacterViewControllerSpec.swift
//  MarvelTests
//
//  Created by Gilberto VIZUETE SALAZAR on 6/19/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import marvelapp_start

class CharacterViewControllerSpec: QuickSpec {
    override func spec() {
      describe("CharacterViewController") {
        
        var controller: CharacterViewController!
        var character: Character!
        
        beforeEach {
          let testBundle = Bundle(for: type(of: self))
          let mockLoader = MockLoader(file: "character", in: testBundle)
          character = (mockLoader?.map(to: Character.self))!
          
          controller = Storyboard.Main.characterViewController.instantiate()
          controller.character = character
          
          // load view components
          let _ = controller.view
        }
        
        context("valid character") {
          it("should setup properties with character information") {
            controller.viewDidLoad()
            let name = controller.name.text
            expect(name).to(equal(character.name))
          }
        }
        
        context("nil character") {
          it("should setup properties with default values") {
            controller.character = nil
            controller.viewDidLoad()
            let name = controller.name.text
            expect(name).to(equal(""))
          }
        }
        
      }
    }
}
