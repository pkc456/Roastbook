//
//  PininterestLayout.swift
//  Collection
//
//  Created by Pradeep Choudhary on 4/25/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

protocol PinterestLayoutDelegate {
  func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath, withWidth:CGFloat) -> CGFloat
}

class PininterestLayout: UICollectionViewLayout {
  
  var delegate: PinterestLayoutDelegate!  //This keeps a reference to the delegate.
  var numberOfColumns = 2
  var cellPadding: CGFloat = 6.0
  private var cache = [UICollectionViewLayoutAttributes]()
  private var contentHeight: CGFloat  = 0.0
  private var contentWidth: CGFloat {
    let insets = collectionView!.contentInset
    return (collectionView?.bounds.width)! - (insets.left + insets.right)
  }

  override func invalidateLayout(){
    cache.removeAll()
    super.invalidateLayout()
  }
  
  //primary objective is to calculate an instance of UICollectionViewLayoutAttributes for every item in the layout.
  override func prepare() {
    
    if cache.isEmpty {
    
      let columnWidth = contentWidth / CGFloat(numberOfColumns)
      var xOffset = [CGFloat]()
      for column in 0 ..< numberOfColumns {
        xOffset.append(CGFloat(column) * columnWidth )
      }
      
      var column = 0
      var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
      
      for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
        let indexPath = NSIndexPath(item: item, section: 0)
        
        let width = columnWidth - cellPadding * 2
        let photoHeight = delegate.collectionView(collectionView: collectionView!, heightForPhotoAtIndexPath: indexPath,withWidth:width)
        let height = cellPadding +  photoHeight
        let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
        let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
        
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
        attributes.frame = insetFrame
        cache.append(attributes)
        
        contentHeight = max(contentHeight, frame.maxY)
        yOffset[column] = yOffset[column] + height
        
        if column >= numberOfColumns - 1 {
          column = 0
        } else {
          column = column + 1
        }
      }
    }
  }
  
  override var collectionViewContentSize: CGSize {
    return CGSize(width: contentWidth, height: contentHeight)
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    
    var layoutAttributes = [UICollectionViewLayoutAttributes]()
    
    //  Iterate through the attributes in cache and check if their frames intersect with rect
    for attributes in cache {
      if attributes.frame.intersects(rect) {
        layoutAttributes.append(attributes)
      }
    }
    return layoutAttributes
  }

  
}
