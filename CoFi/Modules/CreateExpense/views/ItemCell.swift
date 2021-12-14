//
//  ItemCell.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//

import UIKit
class ItemCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let bg: UIView = UIView()
        .configure { v in
            v.backgroundColor = .systemGray6
            v.layer.cornerRadius = 15
            v.heightAnchor.constraint(equalToConstant: 100).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lItem: UILabel = UILabel()
        .configure { v in
            v.text = "Spotify (6)"
            v.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            v.textAlignment = .left
            v.textColor = Asset.Color._1F1F1F.color
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let membersCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MemberCell.self, forCellWithReuseIdentifier: "memberCell")
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        bg.addSubview(lItem)
        lItem.topAnchor.constraint(equalTo: bg.topAnchor, constant: 10).isActive = true
        lItem.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 20).isActive = true
        
        bg.addSubview(membersCollection)
        membersCollection.topAnchor.constraint(equalTo: lItem.bottomAnchor, constant: 10).isActive = true
        membersCollection.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 20).isActive = true
        membersCollection.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: 20).isActive = true
        membersCollection.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        membersCollection.dataSource = self
        membersCollection.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath)
        let cell = membersCollection.dequeueReusableCell(withReuseIdentifier: "memberCell", for: indexPath) as! MemberCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 26, height: 28)
    }
}
