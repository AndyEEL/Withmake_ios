//
//  MainViewController.swift
//  withMake
//
//  Created by 이동건 on 2021/03/17.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var models = [novelModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(novelCell.nib(), forCellReuseIdentifier: novelCell.identifier)
 
        models.append(novelModel(postImageName: "entryImage", postTitle: "화이링화이링", postSummary: "내용", numberOfView: 50, numberOfComment: 100, tag: "개그"))
        models.append(novelModel(postImageName: "entryImage", postTitle: "화이링화이링", postSummary: "내용", numberOfView: 50, numberOfComment: 100, tag: "개그"))
        models.append(novelModel(postImageName: "entryImage", postTitle: "화이링화이링", postSummary: "내용", numberOfView: 50, numberOfComment: 100, tag: "개그"))

    }
    
    //MARK - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        let cell = tableView.dequeueReusableCell(withIdentifier: "novelCell", for: indexPath) as! novelCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110 + 30 //xib 높이 110 여분 30
    }
    
    
}

struct novelModel {
    let postImageName: String
    let postTitle: String
    let postSummary: String
    let numberOfView: Int
    let numberOfComment: Int
    let tag: String
}

