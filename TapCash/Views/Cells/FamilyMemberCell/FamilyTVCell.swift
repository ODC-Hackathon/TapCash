//
//  FamilyTVCell.swift
//  TapCash
//
//  Created by Adham Samer on 07/05/2023.
//

import UIKit

class FamilyTVCell: UITableViewCell {

    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ppImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
