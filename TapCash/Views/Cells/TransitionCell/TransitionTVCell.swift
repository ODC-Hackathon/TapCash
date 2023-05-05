//
//  TransitionTVCell.swift
//  TapCash
//
//  Created by Mahmoud on 05/05/2023.
//

import UIKit

class TransitionTVCell: UITableViewCell {

    
    
    @IBOutlet weak var innerFrame: UIView!
    
    @IBOutlet weak var img: UIImageView!
  
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        innerFrame.layer.cornerRadius = 30
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configImage(){
        img.image = UIImage(named: "Netflix")
        img.layer.cornerRadius = img.layer.bounds.height / 2
        img.layer.shadowOpacity = 10
        img.layer.masksToBounds = (5 != 0)
        img.layer.borderWidth = 2
        
        
    }
    func configLabels(){
        
    }
    
}
