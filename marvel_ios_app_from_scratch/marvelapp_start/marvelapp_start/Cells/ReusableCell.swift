//
//  ReusableCell.swift
//  marvelapp_start
//
//  Created by eduardo on 5/29/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import UIKit

protocol ReusableCell {
  
}

extension ReusableCell where Self: UITableViewCell {
  
  static func cellIdentifier() -> String {
    return String(describing: Self.self)
  }
  
  static func registerForTableView(_ tableView: UITableView) {
    let nib = UINib(nibName: cellIdentifier(), bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: cellIdentifier())
  }
  
  static func dequeueCell(from tableView: UITableView, at indexPath: IndexPath) -> Self {
    if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier(), for: indexPath) as? Self {
      return cell
    } else {
      return Self()
    }
  }
  
}
