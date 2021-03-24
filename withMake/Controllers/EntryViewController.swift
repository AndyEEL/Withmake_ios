//
//  EntryViewController.swift
//  withMake
//
//  Created by 이동건 on 2021/03/24.
//

import UIKit

class EntryViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "registerSegue1", sender: sender)
    }
}


