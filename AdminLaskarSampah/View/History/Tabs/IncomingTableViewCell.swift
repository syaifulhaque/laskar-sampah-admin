//
//  IncomingTableViewCell.swift
//  AdminLaskarSampah
//
//  Created by Egi Muhamad Saefulhaqi on 11/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import UIKit

class IncomingTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var dateCell: UILabel!
    @IBOutlet weak var poinViewCell: UIView!
    @IBOutlet weak var poinCell: UILabel!
    @IBOutlet weak var poinColorCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        poinViewCell.layer.cornerRadius = (poinViewCell.frame.width) / 2
        poinViewCell.clipsToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
