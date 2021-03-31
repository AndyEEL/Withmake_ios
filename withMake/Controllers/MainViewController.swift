//
//  MainViewController.swift
//  withMake
//
//  Created by 이동건 on 2021/03/17.
//

import UIKit

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
        
        let separatorView: UIView = {
            let view = UIView()
            view.backgroundColor = .black
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    func setupViews() {
        
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        
        //중요 NSLayoutConstraints 이해와 옵션 이해
        //중요 translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": thumbnailImageView]));
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": thumbnailImageView]));
        
        //리팩토링 해보기!
        //위에서부터 contraints가 내려온다. 아마 option문제일듯!
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": separatorView]));
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(1)]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": separatorView]));
                    
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
                
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary));
    }
}




extension MainViewController: UICollectionViewDelegateFlowLayout{
    //함수 다 외우기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //중요!!!!
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath)

        return cell
    }
    
    
}

class MainViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = ""
        //navigationController?.isNavigationBarHidden = true
        
        
        let layout = UICollectionViewFlowLayout()
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
                
        view.addSubview(collection)
        collection.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collection.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collection.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        collection.backgroundColor = .white
        
        collection.dataSource = self
        collection.delegate = self
        
        
        
        collection.register(VideoCell.self, forCellWithReuseIdentifier: "VideoCell")
        
    }
    
}
