//
//  MirrorViewController.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 4/23/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit
import AVFoundation

class MirrorViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,PinterestLayoutDelegate {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var arrayMirror : Array<MirrorModel>?

//  var photos = MirrorModel.allPhotos()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchMirrorData()
    
    if let layout = collectionView?.collectionViewLayout as? PininterestLayout {
      layout.delegate = self
    }
  }
  
  private func fetchMirrorData(){
    arrayMirror = MirrorBusinessLayer.sharedInstance.getMirrorModelInformationDataArray()
    collectionView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    let numberOfRow = self.arrayMirror?.count ?? 0
    return numberOfRow
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MirrorCollectionViewCell", for: indexPath)as! MirrorCollectionViewCell
    cell.layer.borderWidth = 1.0
    cell.layer.borderColor = UIColor.red.cgColor
    cell.mirrorModel = arrayMirror?[indexPath.item]
    return cell
  }
  
  
  func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath: NSIndexPath,
                      withWidth width: CGFloat) -> CGFloat {
    let mirrorModelObject = arrayMirror?[indexPath.item]
//    let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
//    let rect  = AVMakeRect(aspectRatio: photo.image.size, insideRect: boundingRect)
//    return rect.size.height
    
    //Calculate height on base of hate percentage
    var minHeight : CGFloat = 100.0
    guard let value = NumberFormatter().number(from: (mirrorModelObject?.hatePercentage)!)
      else {
        return minHeight
    }

    let hatePercentage = CGFloat(value)
    minHeight = minHeight + hatePercentage
//    if(minHeight * (hatePercentage/100) > minHeight){
//      minHeight = minHeight * (hatePercentage/100)
//    }
    return minHeight
  }
}


