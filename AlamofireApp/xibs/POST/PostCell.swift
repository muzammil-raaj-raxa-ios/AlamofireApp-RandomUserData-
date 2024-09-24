//
//  PostCell.swift
//  AlamofireApp
//
//  Created by Mag isb-10 on 26/03/2024.
//

import UIKit

class PostCell: UITableViewCell {

  @IBOutlet weak var bodyLbl: UILabel!
  @IBOutlet weak var titleLbl: UILabel!
  @IBOutlet weak var idLbl: UILabel!
  @IBOutlet weak var userIDlbl: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
