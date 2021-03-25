//
//  MenuBar.swift
//  withMake
//
//  Created by 이동건 on 2021/03/25.
//

import UIKit
 
class MenuBar: UIView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        addSubview(collectionView)
//        addConstraintsWithFormat(format: "H:|[v[0]|", views: collectionView)
//        addConstraintsWithFormat(format: "V:|[v[0]|", views: collectionView)
//                
        backgroundColor = UIColor(named: "backgroundColor")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
