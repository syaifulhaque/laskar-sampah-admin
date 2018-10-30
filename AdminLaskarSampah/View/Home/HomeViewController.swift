//
//  HomeViewController.swift
//  AdminLaskarSampah
//
//  Created by Egi Muhamad Saefulhaqi on 10/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
   
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var stat1: UIView!
    @IBOutlet weak var stat2: UIView!
    @IBOutlet weak var stat3: UIView!
    
    let dataPrice = [["water","Botol", "10"],["plastic-bag", "Plastik", "10"], ["wire", "Tembaga", "15"], ["waste", "Campuran", "5"]]
    
    @IBOutlet weak var listPriceTable: UITableView!
    
    
    @IBOutlet weak var profileView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.alwaysBounceVertical = true
        // Do any additional setup after loading the view.
        profileView.layer.cornerRadius = profileView.frame.width / 10
        stat1.layer.cornerRadius = stat1.frame.width / 2
        stat2.layer.cornerRadius = stat2.frame.width / 2
        stat3.layer.cornerRadius = stat3.frame.width / 2
        
        listPriceTable.delegate = self
        listPriceTable.dataSource = self
        
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPrice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listPrice", for: indexPath) as! ListPriceTableViewCell
        let data: [String] = dataPrice[indexPath.row] as! [String]
        cell.iconWaste.image = UIImage(named: data[0])
        cell.wasteCatName.text = "\(data[1])"
        cell.wastePoin.text = "\(data[2])"
        return cell
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
    
    @IBAction func editProfileAction(_ sender: Any) {
        performSegue(withIdentifier: "EditProfileId", sender: nil)
    }
    
}
