//
//  LoginViewController.swift
//  withMake
//
//  Created by 이동건 on 2021/03/24.
//

import UIKit

class LoginViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "loginSegue", sender: self)
    }
}



