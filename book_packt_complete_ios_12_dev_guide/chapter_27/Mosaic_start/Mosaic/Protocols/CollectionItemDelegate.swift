import UIKit

// fix memory leaks
protocol CollectionItemDelegate: class {
  func didUpdateFavorite(cell: UICollectionViewCell)
}
