                     //
//  AlbumTableViewController.swift
//  TestRN
//
//  Created by Raden on 10/November/20.
//

import UIKit
import Photos

class AlbumTableViewController: UITableViewController {
  var allAlbum = [PHAssetCollection]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = nil
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        getAllAlbum()
    }
  
    func getAllAlbum() -> Void{
      let userAlbum = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: nil)
      let smartAlbum = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .any, options: nil)
      let total = [userAlbum, smartAlbum]
      total.forEach { (item) in
        for number in 0..<(item.count){
          allAlbum.append(item[number])
        }
      }
      tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      return allAlbum.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumTableViewCell
      let fetchResult = PHAsset.fetchAssets(in: allAlbum[indexPath.row], options: PHFetchOptions()) as? PHFetchResult
      let imageManager = PHImageManager.default()
      let requestOptions = PHImageRequestOptions()
      requestOptions.isSynchronous = true
      if (fetchResult?.count ?? 0) >= 1 {
        imageManager.requestImage(for: (fetchResult?.object(at: 0))! as PHAsset, targetSize:view.frame.size , contentMode: .aspectFill, options: requestOptions) { (image, _) in
          cell.thumbnail.image = image
        }
      }
      cell.albumName.text = "\(allAlbum[indexPath.row].localizedTitle ) \(fetchResult!.count)"
//      cell.thumbnail.image = #imageLiteral(resourceName: "tick")
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
