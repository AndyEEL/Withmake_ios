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
        //imageView.image = UIImage(named: <#T##String#>)
        //imageView.contentMode = .scaleAspectFill
        //imageView.clipsToBounds = true
        return imageView
        }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        //imageView.image = UIImage(named: <#T##String#>)
        
        //cornerRadius 와 masksToBounds 는 형제!, 같이다님
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
        }()
        

    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕하세요 윗메이크 앱입니다."
        label.backgroundColor = .cyan
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleTextView: UITextView  = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .white
        textView.text = "안녕하세요 윗메이크 앱입니다.안녕하세요 윗메이크 앱입니다.안녕하세요 윗메이크 앱입니다.안녕하세요 윗메이크 앱입니다."
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = .lightGray
        return textView
    }()
    
    
    
    func setupViews() {
        
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        //중요 NSLayoutConstraints 이해와 옵션 이해
        //중요 translatesAutoresizingMaskIntoConstraints = false
        //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": thumbnailImageView]));
        //위에서부터 contraints가 내려온다. 아마 option문제일듯!
              
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        
        //horizontal constraints
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]|", views: userProfileImageView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        //vertical constraints
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        
        //top constraints 콘스트레인 설정하는 것도 중요함
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //addConstraintsWithFormat(format: "V:[v0(20)]", views: titleLabel)
        
        //top constraints 콘스트레인 설정하는 것도 중요함
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //left constraints
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraints
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height constraints
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
        
        
        
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView { //알고리즘 중요!!
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            //중요!!! 여기서 어토라이징마스크인투콘스타라인트 부여해서 인스턴스 수정하였음
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
                
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary));
    }
}




extension MainViewController: UICollectionViewDelegateFlowLayout{
    //함수 다 외우기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //높이 는 16:10이 좋다.
        let height = (view.frame.width - 16 - 16) * 9 / 16
        //중요!!!!
        return CGSize(width: view.frame.width, height: height + 16 + 68)
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
        
        UINavigationBar.appearance().barTintColor = .red
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = "윗메이크!!"
        
        
        
        
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
