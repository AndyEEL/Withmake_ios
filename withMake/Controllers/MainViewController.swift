//
//  MainViewController.swift
//  withMake
//
//  Created by 이동건 on 2021/03/17.
//

import UIKit

extension MainViewController: UICollectionViewDelegateFlowLayout{
    //함수 다 외우기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath)
        cell.backgroundColor = .blue
        let label = UILabel()
        label.text = "DongunLEE"
        cell.contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: cell.contentView.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: cell.contentView.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
        
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
        
        collection.backgroundColor = .red
        
        collection.dataSource = self
        collection.delegate = self
        
        
        
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CELL")
        
    }
    
}
