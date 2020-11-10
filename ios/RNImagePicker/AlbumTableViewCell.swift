//
//  AlbumTableViewCell.swift
//  TestRN
//
//  Created by Raden on 10/November/20.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  @IBOutlet weak var albumName: UILabel!
  @IBOutlet weak var thumbnail: UIImageView!
  
  override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
