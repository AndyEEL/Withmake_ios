//
//  BookCell.swift
//  withMake
//
//  Created by 이동건 on 2021/04/07.
//

import UIKit

class BookCell: UICollectionViewCell {
    
    var image: UIImage! {
        didSet{
            imageView.image = image
        }
    }
    
    fileprivate let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    fileprivate lazy var verticalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [])
        stack.axis = .vertical
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .cyan
        
        contentView.addSubview(imageView)
        imageView.frame = CGRect(x: 10, y: 10, width: contentView.frame.width/5, height: contentView.frame.width/3 - 15)
//        contentView.addSubview(verticalStackView)
        
        //imageView constraint
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.topAnchor
        
    }
    
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
