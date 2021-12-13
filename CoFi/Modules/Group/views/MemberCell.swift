//
//  MemberCell.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 13/12/21.
//

import UIKit

class MemberCell: UICollectionViewCell {
    
    let profileImage: UIImageView = UIImageView()
        .configure { v in
            v.image = Asset.Image._1.image
            v.contentMode = .scaleAspectFill
            
            v.widthAnchor.constraint(equalToConstant: 28).isActive = true
            v.heightAnchor.constraint(equalToConstant: 28).isActive = true
            
            v.layer.cornerRadius = 14
            v.layer.masksToBounds = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(profileImage)
        profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
