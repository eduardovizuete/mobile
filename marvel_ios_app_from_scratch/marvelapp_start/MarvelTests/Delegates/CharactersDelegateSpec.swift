//
//  CharactersDelegateSpec.swift
//  MarvelTests
//
//  Created by Gilberto VIZUETE SALAZAR on 6/19/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import marvelapp_start

class CharactersDelegateMock: CharactersDelegate {
  
  var didSelecteRowTrigged = false
  
  func didSelectCharacter(at index: IndexPath) {
    didSelecteRowTrigged = true
  }
  
}

class CharactersDelegateSpec: QuickSpec {

    override func spec() {
      describe("CharactersDelegate") {
        
        var controller: CharactersViewController!
        var character: Character!
        
        beforeEach {
          let testBundle = Bundle(for: type(of: self))
          let mockLoader = MockLoader(file: "character", in: testBundle)
          character = (mockLoader?.map(to: Character.self))!
          let apiMock = MarvelAPICallsMock(characters: [character])
          
          controller = Storyboard.Main.charactersViewController.instantiate()
          controller.apiManager = apiMock
          
          // load view components
          let _ = controller.view
        }
        
        it("should have a valid delegate") {
          expect(controller.tableDelegate).toNot(beNil())
        }
        
        it("should have a cell of expected height") {
          let indexPath = IndexPath(row: 0, section: 0)
          let height = controller.tableDelegate?.tableView(controller.tableView, heightForRowAt: indexPath)
          expect(height).to(equal(80))
        }
        
        it("should call delegate on didSelectedRowAt") {
          let indexPath = IndexPath(row: 0, section: 0)
          let charactersDelegateMock = CharactersDelegateMock()
          controller.tableDelegate = CharactersTableDelegate(charactersDelegateMock)
          expect(charactersDelegateMock.didSelecteRowTrigged).to(beFalsy())
          controller.tableDelegate!.tableView(controller.tableView, didSelectRowAt: indexPath)
          expect(charactersDelegateMock.didSelecteRowTrigged).to(beTruthy())
        }
        
      }
    }

}
