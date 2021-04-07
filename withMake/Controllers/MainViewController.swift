//https://www.youtube.com/watch?v=F-L_AiAZ6ME&ab_channel=LetsBuildThatApp
// 에서 사라지고 생기는 네비게이션 바 만들기!!


import UIKit

class MainViewController: UIViewController {
    
    let images: [String] = [
        "book1",
        "book2",
        "book3",
        "book4"
    ]
    let subtitles: [String] = [
        "베스트 소설",
        "새로 나온 소설"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12*1.4
        
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.backgroundColor = .white

        view.addSubview(collection)
        
        collection.dataSource = self
        collection.delegate = self
        collection.register(BookCell.self, forCellWithReuseIdentifier: "CELL")
        collection.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HEADER")
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! BookCell //as! 를 해야지 연결할 수 있음!!
        let image = UIImage(named: self.images[indexPath.row])
        cell.image = image
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    //셀 레이아웃 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = collectionView.frame.width - 24
        let cellHeight: CGFloat = cellWidth/3
        return CGSize(width: cellWidth, height: cellHeight)
    }
    //헤더 셀 설정
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HEADER", for: indexPath)
        headerCell.backgroundColor = .white
        let headerLabel = UILabel()
        headerLabel.text = self.subtitles[indexPath.section]
        headerLabel.font = UIFont.systemFont(ofSize: 18)
        headerCell.addSubview(headerLabel)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.bottomAnchor.constraint(equalTo: headerCell.bottomAnchor,constant: -14).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: headerCell.leadingAnchor,constant: 12).isActive = true
        
        return headerCell
    }
    //헤더 셀 레이아웃 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    
}
