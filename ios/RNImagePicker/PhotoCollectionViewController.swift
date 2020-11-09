//
//  PhotoCollectionViewController.swift
//  MVVMPattern
//
//  Created by Raden on 8/November/20.
//  Copyright © 2020 Raden. All rights reserved.
//

import UIKit
import Photos

private let reuseIdentifier = "Cell"

class PhotoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var result = PHFetchResult<AnyObject>()
    var assetThumbnailSize: CGSize!
    var lastIndex = false;
    var selectedImage = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        if let layout = self.collectionView!.collectionViewLayout as? UICollectionViewFlowLayout{
            let cellSize = layout.itemSize

            self.assetThumbnailSize = CGSize(width: cellSize.width, height: cellSize.height)
        }
        getAllPhoto()
        // Do any additional setup after loading the view.
    }
    
    func getAllPhoto(){
        let allImage = PHAsset.fetchAssets(with: .image, options: PHFetchOptions()) 
        result = allImage as! PHFetchResult<AnyObject>;
        collectionView.reloadData();
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width/4 - 1 , height: width/4-1)
    }
    
    
  @IBAction func onPressCancel(_ sender: UIBarButtonItem) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func onPressDone(_ sender: Any) {
      
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return result.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        
        
        let asset: PHAsset = self.result[indexPath.item] as! PHAsset

        PHImageManager.default().requestImage(for: asset, targetSize: self.assetThumbnailSize, contentMode: .aspectFill, options: nil, resultHandler: {(result, info) in
            if result != nil {
                cell.photo.image = result
            }
        })
        cell.tick.image = nil
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = self.collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
        cell.tick.image = #imageLiteral(resourceName: "tick")
        if(selectedImage.count > 0){
            if(selectedImage.contains(indexPath.row)){
                cell.tick.image = nil
                selectedImage = selectedImage.filter {$0 != indexPath.row}
            }else{
                selectedImage.append(indexPath.row)
            }
        }else{
            selectedImage.append(indexPath.row)
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
