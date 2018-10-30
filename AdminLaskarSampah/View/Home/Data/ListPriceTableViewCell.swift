//
//  ListPriceTableViewCell.swift
//  AdminLaskarSampah
//
//  Created by Egi Muhamad Saefulhaqi on 11/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import UIKit

class ListPriceTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var iconWaste: UIImageView!
    @IBOutlet weak var wasteCatName: UILabel!
    @IBOutlet weak var wastePoin: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
