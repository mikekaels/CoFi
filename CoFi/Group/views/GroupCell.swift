//
//  GroupCell.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 13/12/21.
//

import UIKit

class GroupCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let bg: GradientView = GradientView(gradientStartColor:Asset.Color._00D8Ff.color,
                                              gradientEndColor: Asset.Color._0078Ff.color,
                                              startPoint: CGPoint(x: 1.0, y: 1.0),
                                              endPoint: CGPoint(x: 0.1, y: 0.0))
        .configure { v in
            v.layer.cornerRadius = 35
            v.layer.masksToBounds = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lGroup: UILabel = UILabel()
        .configure { v in
            v.text = "Group Name"
            v.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            v.textAlignment = .left
            v.textColor = .white
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lPeople: UILabel = UILabel()
        .configure { v in
            v.text = "People (4)"
            v.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            v.textAlignment = .left
            v.textColor = Asset.Color.ffdf00.color
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
    
    let bGroupDetail: UIButton = UIButton()
        .configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            v.setTitleColor(Asset.Color._0078Ff.color, for: .normal)
            v.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(detailButtonTapped), for: .touchUpInside)
            v.backgroundColor = UIColor(white: 1, alpha: 1)
            v.heightAnchor.constraint(equalToConstant: 24).isActive = true
            v.widthAnchor.constraint(equalToConstant: 24).isActive = true
            v.layer.cornerRadius = 12
            v.layer.masksToBounds = true
        }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.addSubview(bg)
        bg.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/3.5).isActive = true
        bg.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10).isActive = true
        bg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        bg.addSubview(lGroup)
        lGroup.topAnchor.constraint(equalTo: bg.topAnchor, constant: 20).isActive = true
        lGroup.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 20).isActive = true
        
        bg.addSubview(lPeople)
        lPeople.topAnchor.constraint(equalTo: lGroup.bottomAnchor, constant: 20).isActive = true
        lPeople.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 20).isActive = true
        
        bg.addSubview(membersCollection)
        membersCollection.topAnchor.constraint(equalTo: lPeople.bottomAnchor, constant: 5).isActive = true
        membersCollection.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 20).isActive = true
        membersCollection.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: 20).isActive = true
        membersCollection.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bg.addSubview(bGroupDetail)
        bGroupDetail.topAnchor.constraint(equalTo: bg.topAnchor, constant: 20).isActive = true
        bGroupDetail.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -20).isActive = true
        
        membersCollection.dataSource = self
        membersCollection.delegate = self
    }
    
    @objc func detailButtonTapped() {
        print("Hello World")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath)
        let cell = membersCollection.dequeueReusableCell(withReuseIdentifier: "memberCell", for: indexPath) as! MemberCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 28, height: 28)
    }
    
}


