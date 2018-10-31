//
//  HelperInputViewControllerExtension.swift
//  AdminLaskarSampah
//
//  Created by margono on 30/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import UIKit

extension InputViewController {
    
    func customNavigation() {
//        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1882352941, green: 0.5450980392, blue: 0.4470588235, alpha: 1)
        self.navigationItem.setHidesBackButton(true, animated:true);
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8235294118, green: 0.8117647059, blue: 0.2980392157, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Futura-Bold", size: 25)!]
    }
    
    func setDismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setBackground(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "steve-johnson-548294-unsplash")!)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "steve-johnson-548294-unsplash")
        backgroundImage.contentMode = .scaleAspectFit
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    func setViewDesign() {
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
    
    func setDataPesanan()  {
        for waste in wastes {
            let berat = FunctionHelper.shared.randomFloat(min: 0.1, max: 10.0)
            let harga = FunctionHelper.shared.randomDouble(min: 100.0, max: 5000.0)
            let barang = BarangStruct(jenis: waste, berat: berat, harga: harga)
            self.pesanans.append(barang)
        }
    }
    
}
