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
        self.setBackground()
        self.setDismissKeyboard()
        
        self.setViewDesign()
        self.setPickerViewData()
        self.setDataPesanan()
        self.wasteTable.delegate = self
        self.wasteTable.dataSource = self
        
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
    
    private func customNavigation() {
        self.navigationItem.setHidesBackButton(true, animated:true);
        self.navigationItem.title = "Input Stock"
    }
    
    private func setDismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setBackground(){
        
    }
    
    private func setViewDesign() {
        for background in backgroundViews {
            background.layer.shadowOpacity = 0.3
            background.layer.shadowOffset = CGSize.zero
            background.layer.shadowRadius = 10
            background.layer.cornerRadius = 15
        }
        
        let cornerRadius : CGFloat = 5.0
        
        for button in stockButtons {
            button.backgroundColor = UIColor.clear
            button.layer.borderWidth = 2.0
            button.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            button.layer.cornerRadius = cornerRadius
        }
    }
    
    func setPickerViewData() {
        
        pickerView.delegate = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        typeTextField.inputView = pickerView
        typeTextField.inputAccessoryView = toolBar
    }
    
    @objc func donePicker() {
        InputViewController.tempTypeValue = self.typeTextField.text
        self.typeTextField.resignFirstResponder()
    }
    
    private func setDataPesanan()  {
        for waste in wastes {
            let berat = FunctionHelper.shared.randomFloat(min: 0.1, max: 10.0)
            let harga = FunctionHelper.shared.randomDouble(min: 100.0, max: 5000.0)
            let barang = BarangStruct(jenis: waste, berat: berat, harga: harga)
            self.pesanans.append(barang)
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
