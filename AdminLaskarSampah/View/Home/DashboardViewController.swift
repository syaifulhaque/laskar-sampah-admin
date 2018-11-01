//
//  DashboardViewController.swift
//  AdminLaskarSampah
//
//  Created by Egi Muhamad Saefulhaqi on 31/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import UIKit

class DashboardViewController: UITableViewController {

    
    @IBOutlet weak var statView: UIView!
    
    @IBOutlet weak var stat1View: UIView!
    @IBOutlet weak var stat2View: UIView!
    @IBOutlet weak var stat3View: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var priceListTable: UITableView!
    
    @IBOutlet weak var newsCollecttion: UICollectionView!
    
    
    @IBOutlet var mainView: UITableView!
    
    let dataPrice = [["water","Botol", "10"],["plastic-bag", "Plastik", "10"], ["wire", "Tembaga", "15"], ["waste", "Campuran", "5"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.allowsSelection = false;
        stat1View.layer.cornerRadius = stat1View.frame.width / 2
        stat2View.layer.cornerRadius = stat2View.frame.width / 2
        stat3View.layer.cornerRadius = stat3View.frame.width / 2
        
        stat1View.layer.borderWidth = 2
        stat1View.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        stat2View.layer.borderWidth = 2
        stat2View.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        stat3View.layer.borderWidth = 2
        stat3View.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        statView.layer.cornerRadius = 10
        detailView.layer.cornerRadius = 10
        priceListTable.layer.cornerRadius = 10
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func logoutAction(_ sender: Any) {
        let alert = UIAlertController(title: "Logout", message: "Apakah ingin keluar aplikasi?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            let storyBoard : UIStoryboard = UIStoryboard(name: "Login", bundle:nil)
            let resultViewController = storyBoard.instantiateViewController(withIdentifier: "LoginStoryboardId") as! LoginViewController
            self.present(resultViewController, animated:true, completion:nil)
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    
    @IBAction func editAction(_ sender: Any) {
        performSegue(withIdentifier: "EditProfileIdentifier", sender: nil)
    }
    func toNews(_ sender: Any) {
        performSegue(withIdentifier: "ToNews", sender: nil)
    }
    
    
    // MARK: - Table view data source


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
