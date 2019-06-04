//
//  UIImageView+Kingfisher.swift
//  marvelapp_start
//
//  Created by Gilberto VIZUETE SALAZAR on 6/4/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
  func download(image url: String) {
    guard let imageURL = URL(string: url) else {
      return
    }
    self.kf.setImage(with: ImageResource(downloadURL: imageURL))
  }
}
