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
  var mirrorObject = MirrorRoot()
  var arrayMirrors = [MirrorContentItem]()
  var pageIndex = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Mirrors"
    setUpNavBarButton()
    fetchMirrorData(pageIndex: pageIndex,isLoaderShown: true)
    
    if let layout = collectionView?.collectionViewLayout as? PininterestLayout {
      layout.delegate = self
    }
  }
  
  private func setUpNavBarButton(){
    let search = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: nil, action: nil)
    self.navigationItem.rightBarButtonItem = search
  }
  
  private func fetchMirrorData(pageIndex:Int, isLoaderShown:Bool){
    WebServiceHandler.sharedInstance.getMirrorInformation(paginationIndex: pageIndex, isShowLoader: isLoaderShown, successBlock: { (MirrorRoot) in
      self.mirrorObject = MirrorRoot
      self.arrayMirrors.append(contentsOf: MirrorRoot.content)
      
      DispatchQueue.main.async {
        let layout : PininterestLayout = self.collectionView.collectionViewLayout as! PininterestLayout
        layout.invalidateLayout()
        self.collectionView.reloadData()
      }
    }) { (error) in
      self.showAlert(title: "Error", message: error.localizedDescription)

    }

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: Collection view delegates
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    let numberOfRow = self.arrayMirrors?.count ?? 0
    return self.arrayMirrors.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MirrorCollectionViewCell", for: indexPath)as! MirrorCollectionViewCell

    cell.mirrorModel = arrayMirrors[indexPath.item]
    
    return cell
  }
  
  
  func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath: NSIndexPath,
                      withWidth width: CGFloat) -> CGFloat {
    let mirrorModelObject = arrayMirrors[indexPath.item]
    
//    let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
//    let rect  = AVMakeRect(aspectRatio: photo.image.size, insideRect: boundingRect)
//    return rect.size.height
    
    //Calculate height on base of hate percentage
    var minHeight : CGFloat = 100.0
    let hatePercentage = CGFloat(mirrorModelObject.percentage)
    minHeight = minHeight + hatePercentage
    return minHeight
  }
  
  public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath){
    if(arrayMirrors.count-2 == indexPath.row && pageIndex-1 < mirrorObject.totalPages){
      pageIndex += 1
      fetchMirrorData(pageIndex: pageIndex,isLoaderShown: false)
    }

  }

}


