//
//  HistoryDetailViewController.swift
//  AdminLaskarSampah
//
//  Created by Egi Muhamad Saefulhaqi on 15/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import UIKit

class HistoryDetailViewController: UIViewController {

    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableHeaderView: UIView!
    
    @IBOutlet weak var detailTrxTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.layer.cornerRadius = 20
        tableHeaderView.layer.cornerRadius = 20
        detailTrxTableView.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.topItem?.leftBarButtonItem?.tintColor = #colorLiteral(red: 0.8784313725, green: 0.3960784314, blue: 0.3019607843, alpha: 1)
        navigationController?.navigationBar.topItem?.leftBarButtonItem?.title = "Back"
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
