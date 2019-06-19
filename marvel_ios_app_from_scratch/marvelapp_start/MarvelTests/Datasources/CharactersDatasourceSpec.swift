//
//  CharactersDatasourceSpec.swift
//  MarvelTests
//
//  Created by Gilberto VIZUETE SALAZAR on 6/19/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import marvelapp_start

class CharactersDatasourceSpec: QuickSpec {

  override func spec() {
    describe("CharactersDatasource") {
      
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
      
      it("should have a valid datasource") {
        expect(controller.tableDatasource).toNot(beNil())
      }
      
      it("should have a cell of expected type"){
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = controller.tableDatasource!.tableView(controller.tableView, cellForRowAt: indexPath)
        expect(cell.isKind(of: CharacterTableCell.self)).to(beTruthy())
      }
      
      it("should have a configured cell") {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = controller.tableDatasource!.tableView(controller.tableView, cellForRowAt: indexPath) as! CharacterTableCell
        let name = cell.name.text!
        expect(name).to(equal(character.name))
      }
      
      it("should have the right numberOfRowsInSection"){
        let count = controller.tableDatasource!.tableView(controller.tableView, numberOfRowsInSection: 0)
        expect(count).to(equal(1))
      }
      
    }
  }
  
}
