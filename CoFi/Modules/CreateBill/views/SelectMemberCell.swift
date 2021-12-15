//
//  SelectMemberCell.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//

import UIKit
class SelectMemberCell: UICollectionViewCell {
    var cellSelected: Bool = true {
        didSet {
            bRemove.isHidden = !cellSelected
        }
    }
    
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
            v.textColor = Asset.Color._1F1F1F.color
            v.textAlignment = .center
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let bRemove: UIButton = UIButton()
        .configure { v in
            v.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            v.tintColor = Asset.Color._0078Ff.color
            v.widthAnchor.constraint(equalToConstant: 20).isActive = true
            v.heightAnchor.constraint(equalToConstant: 20).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(_remove), for: .touchUpInside)
        }
    
    @objc func _remove() {
        print("Removed...")
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
        bRemove.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: -5).isActive = true
        bRemove.trailingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 7).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
