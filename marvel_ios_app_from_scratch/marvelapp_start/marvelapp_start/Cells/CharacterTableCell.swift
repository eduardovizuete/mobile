//
//  CharacterTableCell.swift
//  marvelapp_start
//
//  Created by eduardo on 5/30/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import UIKit
import Kingfisher

final class CharacterTableCell: UITableViewCell, ReusableCell {

  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var thumb: UIImageView!
  
  static func height() -> CGFloat {
    return 80
  }
  
  func setup(item: Character) {
    name.text = item.name
    download(thumb: item.thumbImage?.fullPath() ?? "")
  }
  
}

extension CharacterTableCell {
  func download(thumb url: String) {
    guard let imageURL = URL(string: url) else {
      return
    }
    
    thumb.kf.setImage(with: ImageResource(downloadURL: imageURL))
  }
}
