//
//  UserCell.swift
//  PodTest
//
//  Created by Mag isb-10 on 24/09/2024.
//

import UIKit

class UserCell: UITableViewCell {
  
  @IBOutlet weak var nameLbl: UILabel!
  @IBOutlet weak var profileImg: UIImageView!
  @IBOutlet weak var emailLbl: UILabel!
  @IBOutlet weak var nationalityLbl: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        
    profileImg.layer.cornerRadius = profileImg.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
