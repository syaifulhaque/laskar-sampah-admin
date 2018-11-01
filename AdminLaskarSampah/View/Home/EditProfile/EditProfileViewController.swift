//
//  EditProfileViewController.swift
//  AdminLaskarSampah
//
//  Created by margono on 16/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var headerView: UIImageView!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet var textFieldDatas: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Edit Profile"
        setBackgroundColorTextField()
        setDismissKeyboard()
        customView()
    navigationController?.setNavigationBarHidden(navigationController?.isNavigationBarHidden == false, animated: true);
        
    }
    
    func setBackgroundColorTextField() {
        for textField in textFieldDatas {
            textField.backgroundColor = #colorLiteral(red: 0.9687921405, green: 0.9892645478, blue: 0.9668440223, alpha: 1)
        }
    }
    
    private func setDismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func customView() {
        let cornerRadius : CGFloat = 5.0
        
        submitButton.backgroundColor = UIColor.clear
        submitButton.layer.borderWidth = 2.0
        submitButton.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        submitButton.layer.cornerRadius = cornerRadius
    }
    
    
    @IBAction func submitAction(_ sender: Any) {
        let alert = UIAlertController(title: "Update Data", message: "Sukses update data", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let resultViewController = storyBoard.instantiateViewController(withIdentifier: "MainStoryboardId") as! ViewController
            self.present(resultViewController, animated:true, completion:nil)
            
        }))
        
        self.present(alert, animated: true)
    }
    
}
