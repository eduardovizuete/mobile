//
//  CharactersViewControllerSpec.swift
//  MarvelTests
//
//  Created by Gilberto VIZUETE SALAZAR on 6/19/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import marvelapp_start

struct MarvelAPICallsMock: MarvelAPICalls {
  let characters: [Character]
  
  func characters(query: String? = nil, completion: @escaping ([Character]?) -> Void) {
    completion(characters)
  }
  
}

class CharactersViewControllerSpec: QuickSpec {
  override func spec() {
    describe("CharactersViewController") {
      
      var controller: CharactersViewController!
      var apiMock: MarvelAPICalls!
      
      beforeEach {
        let testBundle = Bundle(for: type(of: self))
        let mockLoader = MockLoader(file: "character", in: testBundle)
        let character = (mockLoader?.map(to: Character.self))!
        apiMock = MarvelAPICallsMock(characters: [character])
        
        controller = Storyboard.Main.charactersViewController.instantiate()
        controller.apiManager = apiMock
        
        // Load view components
        let _ = controller.view
      }
      
      it("should have expected props setup") {
        controller.viewDidLoad()
        expect(controller.apiManager).toNot(beNil())
        expect(controller.tableDatasource).toNot(beNil())
        expect(controller.tableDelegate).toNot(beNil())
        expect(controller.collectionDatasource).to(beNil())
        expect(controller.collectionDelegate).to(beNil())
        expect(controller.characters).toNot(beNil())
        expect(controller.searchBar).toNot(beNil())
        expect(controller.activityIndicator).toNot(beNil())
        expect(controller.tableView).toNot(beNil())
        expect(controller.collectionView).toNot(beNil())
      }
      
      it("should use mock response on fetchCharacters") {
        controller.viewDidLoad()
        let count = controller.tableDatasource?.items.count ?? 0
        expect(count).toEventually(equal(1))
      }
      
      it("should be able to display content as tableView") {
        controller.viewDidLoad()
        controller.showAsTable(UIButton())
        expect(controller.collectionView.isHidden).to(beTruthy())
        expect(controller.tableView.isHidden).to(beFalsy())
      }
      
      it("should be able to display content as collectionView") {
        controller.viewDidLoad()
        controller.showAsGrid(UIButton())
        expect(controller.tableView.isHidden).to(beTruthy())
        expect(controller.collectionView.isHidden).to(beFalsy())
      }
      
      context("Empty search") {
        it("should not fetchCharacters when no searchTerm is provided") {
          controller.searchBar.text = ""
          let searchBar = controller.searchBar
          controller.characters = []
          controller.searchBarSearchButtonClicked(searchBar!)
          expect(controller.characters.isEmpty).to(beTruthy())
        }
      }
      
      context("Not empty search") {
        it("should fetchCharacters when searchTerm is provided") {
          controller.searchBar.text = "searchThis"
          let searchBar = controller.searchBar
          controller.characters = []
          controller.searchBarSearchButtonClicked(searchBar!)
          expect(controller.characters.isEmpty).to(beFalsy())
        }
      }
      
      it("should hide keyboard with click on searchbar cancel button"){
        let searchBar = controller.searchBar!
        searchBar.becomeFirstResponder()
        controller.searchBarCancelButtonClicked(searchBar)
        expect(searchBar.isFirstResponder).to(beFalsy())
      }
      
      context("didSelectCharacter") {
        beforeEach {
          let navController: UINavigationController = Storyboard.Main.initialScene.instantiate()
          controller = navController.viewControllers.first as! CharactersViewController
          controller.apiManager = apiMock
          let _ = controller.view
          controller.viewDidLoad()
        }
        
        it("should navigate do next controller when selecting a character") {
          let indexPath = IndexPath(row: 0, section: 0)
          let controllerCounts = controller.navigationController?.viewControllers.count
          expect(controllerCounts).to(equal(1))
          controller.didSelectCharacter(at: indexPath)
          expect(controller.navigationController?.viewControllers.count ?? 0).toEventually(equal(2), timeout: 3)
        }
      }
      
    }
  }

}
