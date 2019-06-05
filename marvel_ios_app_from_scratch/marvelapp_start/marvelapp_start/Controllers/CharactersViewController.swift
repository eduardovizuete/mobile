//
//  CharactersViewController.swift
//  marvelapp_start
//
//  Created by eduardo on 5/28/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import UIKit

protocol CharactersDelegate {
  func didSelectCharacter(at index: IndexPath)
}

final class CharactersViewController: UIViewController {
  let apiManager = MarvelAPIManager()
  
  var tableDatasource: CharactersDatasource?
  var tableDelegate: CharactersTableDelegate?
  
  var collectionDatasource: CharactersCollectionDatasource?
  var collectionDelegate: CharactersCollectionDelegate?
  
  var characters: [Character] = []
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var collectionView: UICollectionView!
}

extension CharactersViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchCharacters()
  }
}

extension CharactersViewController {
  func fetchCharacters() {
    activityIndicator.startAnimating()
    apiManager.characters { characters in
      self.activityIndicator.stopAnimating()
      if let characters = characters {
        self.setupTableView(with: characters)
      }
    }
  }
  
  func setupTableView(with characters: [Character]) {
    self.characters = characters
    tableView.isHidden = false
    collectionView.isHidden = true
    tableDelegate = CharactersTableDelegate(self)
    tableDatasource = CharactersDatasource(items: characters, tableView: self.tableView, delegate: tableDelegate!)
  }
  
  func setupCollectionView(with characters: [Character]) {
    self.characters = characters
    collectionView.isHidden = false
    tableView.isHidden = true
    collectionDelegate = CharactersCollectionDelegate(self)
    collectionDatasource = CharactersCollectionDatasource(items: characters,
                                                          collectionView: self.collectionView,
                                                          delegate: collectionDelegate!)
  }
}

extension CharactersViewController {
  @IBAction func showAsGrid(_ sender: UIButton) {
    setupCollectionView(with: characters)
  }
  
  @IBAction func showAsTable(_ sender: UIButton) {
    setupTableView(with: characters)
  }
}

extension CharactersViewController: CharactersDelegate {
  func didSelectCharacter(at index: IndexPath) {
    let character = characters[index.row]
    print(character.name)
  }
}
