//
//  CharactersViewController.swift
//  marvelapp_start
//
//  Created by eduardo on 5/28/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import UIKit

final class CharactersViewController: UIViewController {
  let apiManager = MarvelAPIManager()
  var dataSource: CharactersDatasource?
  var delegate: CharactersDelegate?
  
  var characters: [Character] = []
  
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var tableView: UITableView!
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
    delegate = CharactersDelegate()
    dataSource = CharactersDatasource(items: characters, tableView: self.tableView, delegate: delegate!)
  }
}
