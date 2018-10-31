//
//  TableInputViewControllerExtension.swift
//  AdminLaskarSampah
//
//  Created by margono on 13/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import UIKit

extension InputViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Stock"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textAlignment = NSTextAlignment.center
        header.textLabel?.textColor = #colorLiteral(red: 0.3568627451, green: 0.3568627451, blue: 0.3568627451, alpha: 1)
        header.textLabel?.font = UIFont(name: "Futura-Bold", size: 20)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pesanans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.wasteTable.dequeueReusableCell(withIdentifier: "wasteIdentifier", for: indexPath) as! WasteTableViewCell
        cell.typeLabel.text = self.pesanans[indexPath.row].jenis
        cell.priceLabel.text = String(self.pesanans[indexPath.row].harga)
        cell.weightLabel.text = String(self.pesanans[indexPath.row].berat)

        return cell
    }
    
}
