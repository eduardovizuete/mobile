//
//  CharactersCollectionDatasource.swift
//  marvelapp_start
//
//  Created by Gilberto VIZUETE SALAZAR on 6/4/19.
//  Copyright © 2019 eduardo. All rights reserved.
//

import UIKit

final class CharactersCollectionDatasource: NSObject, ItemsCollectionViewDatasource {
  
  var items: [Character] = []
  weak var collectionView: UICollectionView?
  weak var delegate: UICollectionViewDelegate?
  
  init(items: [Character], collectionView: UICollectionView, delegate: UICollectionViewDelegate) {
    self.items = items
    self.collectionView = collectionView
    self.delegate = delegate
    super.init()
    CharacterCollectionCell.registerForCollectionView(collectionView)
    self.setupCollectionView()
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = CharacterCollectionCell.dequeueCell(from: collectionView, at: indexPath)
    let character = self.items[indexPath.row]
    cell.setup(item: character)
    return cell
  }
}

class CharactersCollectionDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.bounds.size.width
    return CharacterCollectionCell.size(for: width)
  }
}
