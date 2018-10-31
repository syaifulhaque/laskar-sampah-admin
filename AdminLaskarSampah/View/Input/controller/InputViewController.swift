//
//  InputViewController.swift
//  AdminLaskarSampah
//
//  Created by Egi Muhamad Saefulhaqi on 10/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, ScannerDelegate {
    
    let wastes = ["", "Botol", "Koran", "Buku", "Plastik"]
    let pickerView = UIPickerView()
    var pesanans : [BarangStruct] = []
    var scannerDelegate : ScannerDelegate?
    var valueOfScanner = String()
    static var tempTypeValue : String?
    static var tempWeight : String?
    
    @IBOutlet var backgroundViews: [UIView]!
    @IBOutlet weak var wasteTable: UITableView!
    @IBOutlet weak var sourceTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet var stockButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customNavigation()
        self.setDismissKeyboard()
        
        self.setViewDesign()
        self.setPickerViewData()
        self.wasteTable.delegate = self
        self.wasteTable.dataSource = self

        self.setDataPesanan()
//        self.setBackground()
        
        self.sourceTextField.text = valueOfScanner
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.customNavigation()
        self.typeTextField.text = InputViewController.tempTypeValue
        if let weight = InputViewController.tempWeight {
            self.weightTextField.text = weight
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.customNavigation()
        self.typeTextField.text = InputViewController.tempTypeValue
        if let weight = InputViewController.tempWeight {
            self.weightTextField.text = weight
        }
    }
    
    @IBAction func scanAction(_ sender: Any) {
        performSegue(withIdentifier: "ScanIdentifier", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ScannerViewController {
            destination.scannerDelegate = self
        }
    }
    
    @IBAction func addAction(_ sender: Any) {
        InputViewController.tempWeight = self.weightTextField.text
        self.weightTextField.resignFirstResponder()
    }
    
    func setValueOfScanner(value: String) {
        self.valueOfScanner = value
    }
    
    
    @IBAction func submitAction(_ sender: Any) {
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "MainStoryboardId") as! ViewController
//        self.present(resultViewController, animated:true, completion:nil)
        
        let alert = UIAlertController(title: "Save Data", message: "Berhasil menyimpan data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }
    
}
