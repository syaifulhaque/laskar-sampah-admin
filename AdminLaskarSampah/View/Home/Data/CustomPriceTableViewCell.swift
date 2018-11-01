//
//  CustomPriceTableViewCell.swift
//  AdminLaskarSampah
//
//  Created by Egi Muhamad Saefulhaqi on 31/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import UIKit

class CustomPriceTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    
     let dataPrice = [["water","Botol", "10"],["plastic-bag", "Plastik", "10"], ["wire", "Tembaga", "15"], ["waste", "Campuran", "5"]]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPrice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listPrice", for: indexPath) as! ListPriceTableViewCell
        let data: [String] = dataPrice[indexPath.row] as! [String]
        //cell.iconWaste.image = UIImage(named: data[0])
        cell.wasteCatName.text = "\(data[1])"
        cell.wastePoin.text = "\(data[2])"
        return cell
    }
    

    @IBOutlet weak var tableHArga: UITableView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.tableHArga.delegate = self
        self.tableHArga.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
