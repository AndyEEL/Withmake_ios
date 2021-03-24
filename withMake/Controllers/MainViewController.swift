//
//  MainViewController.swift
//  withMake
//
//  Created by 이동건 on 2021/03/17.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "novelCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")

        
    }
    //MARK - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //cell 을 몇 개 불러올지 데이터 확인하는 과정
        print(2)
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
        let cell = tableView.dequeueReusableCell(withIdentifier:"ReusableCell", for: indexPath) as! novelCell
        return cell
        
        
    }
}
