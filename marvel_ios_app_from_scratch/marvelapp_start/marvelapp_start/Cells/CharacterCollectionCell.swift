//
//  CharacterCollectionCell.swift
//  marvelapp_start
//
//  Created by Gilberto VIZUETE SALAZAR on 6/4/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import UIKit
import Reusable

class CharacterCollectionCell: UICollectionViewCell, NibReusable {
  
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var thumb: UIImageView!
  
  static let paddingBtwCells = CGFloat(10)
  
  static func size(for parentWidth: CGFloat) -> CGSize {
    let numberOfCells = CGFloat(2)
    let totalPadding = CGFloat(numberOfCells + 1) * paddingBtwCells
    let width = (parentWidth - totalPadding) / numberOfCells
    return CGSize(width: width, height: width)
  }
  
  func setup(item: Character) {
    name.text = item.name
    thumb.download(image: item.thumbImage?.fullPath() ?? "")
  }
  
}
