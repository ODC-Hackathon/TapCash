//
//  ProfilesCVCell.swift
//  TapCash
//
//  Created by Adham Samer on 07/05/2023.
//

import UIKit

class ProfilesCVCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!{
        didSet{
            image.image = UIImage(named: "avatar")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configName(_ userName : String){
          name.text = userName
      }
}
