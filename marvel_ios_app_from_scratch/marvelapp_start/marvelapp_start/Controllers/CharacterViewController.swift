//
//  CharacterViewController.swift
//  marvelapp_start
//
//  Created by eduardo on 5/28/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import UIKit

final class CharacterViewController: UIViewController {
  
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var image: UIImageView!
  
  var character: Character?
  
}

extension CharacterViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

extension CharacterViewController {
  func setupView() {
    name.text = character?.name ?? ""
    image.download(image: character?.thumbImage?.fullPath() ?? "")
  }
}
