//
//  CharacterTableCell.swift
//  marvelapp_start
//
//  Created by eduardo on 5/30/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import UIKit
import Reusable

final class CharacterTableCell: UITableViewCell, NibReusable {

  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var thumb: UIImageView!
  
  static func height() -> CGFloat {
    return 80
  }
  
  func setup(item: Character) {
    name.text = item.name
    thumb.download(image: item.thumbImage?.fullPath() ?? "")
  }
  
}
