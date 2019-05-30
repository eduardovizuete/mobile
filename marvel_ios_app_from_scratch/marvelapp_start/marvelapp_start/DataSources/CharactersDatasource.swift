//
//  CharactersDatasource.swift
//  marvelapp_start
//
//  Created by eduardo on 5/29/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import UIKit

final class CharactersDatasource: NSObject, ItemsTableViewDatasource {
  
  var items: [Character] = []
  weak var tableView: UITableView?
  weak var delegate: UITableViewDelegate?
  
  required init(items: [T], tableView: UITableView, delegate: UITableViewDelegate) {
    self.items = items
    self.tableView = tableView
    self.delegate = delegate
    super.init()
    CharacterTableCell.registerForTableView(tableView)
    self.setupTableView()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = CharacterTableCell.dequeueCell(from: tableView, at: indexPath)
    let character = self.items[indexPath.row]
    cell.setup(item: character)
    return cell
  }
  
}

class CharactersDelegate: NSObject, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CharacterTableCell.height()
  }
  
}
