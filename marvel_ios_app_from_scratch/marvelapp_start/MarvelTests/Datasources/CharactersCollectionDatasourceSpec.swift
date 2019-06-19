//
//  CharactersCollectionDatasourceSpec.swift
//  MarvelTests
//
//  Created by Gilberto VIZUETE SALAZAR on 6/19/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import marvelapp_start

class CharactersCollectionDatasourceSpec: QuickSpec {

  override func spec() {
    describe("CharactersCollectionDatasource") {
      
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
        controller.showAsGrid(UIButton())
      }
      
      it("should have a valid datasource") {
        expect(controller.collectionDatasource).toNot(beNil())
      }
      
      it("should have a cell of expected type") {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = controller.collectionDatasource!.collectionView(controller.collectionView, cellForItemAt: indexPath)
        expect(cell.isKind(of: CharacterCollectionCell.self)).to(beTruthy())
      }
      
      it("should have a configured cell") {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = controller.collectionDatasource!.collectionView(controller.collectionView, cellForItemAt: indexPath) as! CharacterCollectionCell
        let name = cell.name.text!
        expect(name).to(equal(character.name))
      }
      
      it("should have the right numberOfRowsInSection") {
        let count = controller.collectionDatasource!.collectionView(controller.collectionView, numberOfItemsInSection: 0)
        expect(count).to(equal(1))
      }
      
    }
  }

}
