import UIKit

class ListCollectionViewCell: UICollectionViewCell {
  // fix memory leaks (use always weak reference for delegates)
  weak var delegate: CollectionItemDelegate?
}
