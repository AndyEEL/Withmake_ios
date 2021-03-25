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
        /*
        //이미지 크기문제에서, 문제가 발생하는듯, 1) 크기를 줄이거나 2) 리사이징 매소드 만들기
        //https://uptech.team/blog/build-resizing-image-in-navigation-bar-with-large-title
        //https://hcn1519.github.io/articles/2018-03/barbuttoncircleimage
        //navigationItem.backButtonDisplayMode = .default
        navigationController?.navigationBar.isTranslucent = false
        let userImageBtn = UIBarButtonItem(title: "userImgBtn", style: .plain, target: nil, action: nil)
        
        userImageBtn.image = UIImage(named: "userImage")
        self.navigationItem.leftBarButtonItem = userImageBtn
        */
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.black
        navigationItem.titleView = titleLabel
        navigationController?.isNavigationBarHidden = true
        
        setupMenuBar()
            
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(novelCell.nib(), forCellReuseIdentifier: novelCell.identifier)
 
        
        //프로토타입 셀 만들기
        models.append(novelModel(postImageName: "entryImage", postTitle: "화이링화이링", postSummary: "내용", numberOfView: 50, numberOfComment: 100, tag: "개그"))
        models.append(novelModel(postImageName: "entryImage", postTitle: "화이링화이링", postSummary: "내용", numberOfView: 50, numberOfComment: 100, tag: "개그"))
        models.append(novelModel(postImageName: "entryImage", postTitle: "화이링화이링", postSummary: "내용", numberOfView: 50, numberOfComment: 100, tag: "개그"))
        models.append(novelModel(postImageName: "entryImage", postTitle: "화이링화이링", postSummary: "내용", numberOfView: 50, numberOfComment: 100, tag: "개그"))

    }
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        // 아래 코드 있음
        view.addConstraintsWithFormat(format: "H:|[v0]|" , views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(100)]", views: menuBar)
        
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



// MARK - addConstraintsWithFormat method

extension UIView {

    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDict = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDict["v\(index)"] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDict))
    }
    
    func addConstraintsFillEntireView(view: UIView) {
        addConstraintsWithFormat(format: "H:|[v0]|", views: view)
        addConstraintsWithFormat(format: "V:|[v0]|", views: view)
    }
}



