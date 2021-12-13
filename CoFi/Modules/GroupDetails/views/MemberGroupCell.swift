//
//  MemberGroupCell.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//

import UIKit
class MemberGroupCell: UITableViewCell {
    let profileImage: UIImageView = UIImageView()
        .configure { v in
            v.image = Asset.Image._6.image
            v.contentMode = .scaleAspectFill
            v.layer.cornerRadius = 20
            v.layer.masksToBounds = true
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.widthAnchor.constraint(equalToConstant: 50).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lUser = UILabel()
        .configure { v in
            v.text = "Blake"
            v.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            v.textAlignment = .left
            v.textColor = Asset.Color._1F1F1F.color
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lPhone = UILabel()
        .configure { v in
            v.text = "0673373222"
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textAlignment = .left
            v.textColor = Asset.Color.a9A9A9.color
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(profileImage)
        profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26).isActive = true
        
        contentView.addSubview(lUser)
        lUser.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20).isActive = true
        lUser.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        
        contentView.addSubview(lPhone)
        lPhone.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20).isActive = true
        lPhone.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        
    }
}

