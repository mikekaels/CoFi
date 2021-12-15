//
//  MemberSelectedCell.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//

protocol MemberSelectedCellDelegate {
    func removeUser(email: String)
}

import UIKit
class MemberSelectedCell: UICollectionViewCell {
    
    var delegate: MemberSelectedCellDelegate!
    var email: String!
    
    let profileImage: UIImageView = UIImageView()
        .configure { v in
            v.image = Asset.Image._6.image
            v.contentMode = .scaleAspectFill
            
            v.widthAnchor.constraint(equalToConstant: 60).isActive = true
            v.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            v.layer.cornerRadius = 30
            v.layer.masksToBounds = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lName: UILabel = UILabel()
        .configure { v in
            v.text = "Paul"
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textColor = .white
            v.textAlignment = .center
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let bRemove: UIButton = UIButton()
        .configure { v in
            v.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
            v.tintColor = .white
            v.widthAnchor.constraint(equalToConstant: 20).isActive = true
            v.heightAnchor.constraint(equalToConstant: 20).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(_remove), for: .touchUpInside)
        }
    
    @objc func _remove() {
        self.delegate.removeUser(email: self.email)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(profileImage)
        profileImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.addSubview(lName)
        lName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        lName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 5).isActive = true
        
        contentView.addSubview(bRemove)
        bRemove.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 0).isActive = true
        bRemove.trailingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
