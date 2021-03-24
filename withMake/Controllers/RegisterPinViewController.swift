//
//  RegisterPinViewController.swift
//  withMake
//
//  Created by 이동건 on 2021/03/24.
//

import UIKit

class RegisterPinViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func pinLoginBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "register2Segure", sender: self)
    }
}

