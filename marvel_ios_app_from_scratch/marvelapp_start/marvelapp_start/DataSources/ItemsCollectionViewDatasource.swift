//
//  ItemsCollectionViewDatasource.swift
//  marvelapp_start
//
//  Created by Gilberto VIZUETE SALAZAR on 6/4/19.
//  Copyright © 2019 eduardo. All rights reserved.
//
  
import UIKit
  
protocol ItemsCollectionViewDatasource: UICollectionViewDataSource {
  associatedtype T
  var items:[T] { get }
  weak var collectionView: UICollectionView? { get }
  weak var delegate: UICollectionViewDelegate? { get }
  
  init (items: [T], collectionView: UICollectionView, delegate: UICollectionViewDelegate)
  
  func setupCollectionView()
}

extension ItemsCollectionViewDatasource {
  func setupCollectionView() {
    self.collectionView?.dataSource = self
    self.collectionView?.delegate = self.delegate
    self.collectionView?.reloadData()
  }
}
