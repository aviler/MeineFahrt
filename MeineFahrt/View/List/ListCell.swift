//
//  ListViewCell.swift
//  MeineFahrt
//
//  Created by Oliver M Batista on 20/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

import UIKit


class ListCell: UITableViewCell {

  @IBOutlet weak var fleet: UIImageView!
  @IBOutlet weak var address: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
