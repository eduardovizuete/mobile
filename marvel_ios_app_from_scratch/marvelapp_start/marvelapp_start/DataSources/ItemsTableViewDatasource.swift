//
//  ItemsTableViewDatasource.swift
//  marvelapp_start
//
//  Created by eduardo on 5/29/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import UIKit

protocol ItemsTableViewDatasource: UITableViewDataSource {
  associatedtype T
  var items: [T] { get }
  var tableView: UITableView? { get }
  var delegate: UITableViewDelegate? { get }
  
  init(items: [T], tableView: UITableView, delegate: UITableViewDelegate)
  
  func setupTableView()
}

extension ItemsTableViewDatasource {
  func setupTableView() {
    self.tableView?.dataSource = self
    self.tableView?.delegate = self.delegate
    self.tableView?.reloadData()
  }
}


