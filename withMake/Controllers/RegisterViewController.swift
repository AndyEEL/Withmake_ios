//
//  RegisterViewController.swift
//  withMake
//
//  Created by 이동건 on 2021/03/24.
//

import UIKit

class RegisterViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func checkPinBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "register1Segure", sender: self)
        
    }
}

