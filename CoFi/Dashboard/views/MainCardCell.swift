//
//  MainCardCell.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//

import UIKit

class MainCardCell: UICollectionViewCell {
    
    let bgView: UIView = UIView()
        .configure { v in
            v.layer.cornerRadius = 17
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = UIColor(white: 1, alpha: 0.3)
        }
    
    let profileImage: UIImageView = UIImageView()
        .configure { v in
            v.image = Asset.Image._1.image
            v.contentMode = .scaleAspectFill
            
            v.widthAnchor.constraint(equalToConstant: 34).isActive = true
            v.heightAnchor.constraint(equalToConstant: 34).isActive = true
            
            v.layer.cornerRadius = 17
            v.layer.masksToBounds = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lUser: UILabel = UILabel()
        .configure { v in
            v.text = "Michael"
            v.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            v.textAlignment = .left
            v.textColor = .white
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bgView)
        
        bgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        bgView.addSubview(profileImage)
        profileImage.leadingAnchor.constraint(equalTo: bgView.leadingAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: bgView.centerYAnchor).isActive = true
        
        bgView.addSubview(lUser)
        lUser.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 5).isActive = true
        lUser.centerYAnchor.constraint(equalTo: bgView.centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
