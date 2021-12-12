//
//  TransactionCell.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 13/12/21.
//

import UIKit

class TransactionCell: UITableViewCell {
    let bg: UIView = UIView()
        .configure { v in
            v.backgroundColor = Asset.Color.ffeed1.color
            v.layer.cornerRadius = 14
            v.heightAnchor.constraint(equalToConstant: 42).isActive = true
            v.widthAnchor.constraint(equalToConstant: 42).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let icon: UIImageView = UIImageView()
        .configure { v in
            v.image = UIImage(systemName: "cart.fill")
            v.tintColor = Asset.Color.ffa200.color
            v.translatesAutoresizingMaskIntoConstraints = false
            v.contentMode = .scaleAspectFit
            v.widthAnchor.constraint(equalToConstant: 23).isActive = true
            v.heightAnchor.constraint(equalToConstant: 23).isActive = true
        }
    
    let lItem = UILabel()
        .configure { v in
            v.text = "Grocery"
            v.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            v.textAlignment = .left
            v.textColor = Asset.Color._1F1F1F.color
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lPrice = UILabel()
        .configure { v in
            v.text = "Rp 97.000"
            v.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            v.textAlignment = .right
            v.textColor = Asset.Color._1F1F1F.color
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
        contentView.addSubview(bg)
        bg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26).isActive = true
        
        bg.addSubview(icon)
        icon.centerYAnchor.constraint(equalTo: bg.centerYAnchor).isActive = true
        icon.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        
        contentView.addSubview(lItem)
        lItem.leadingAnchor.constraint(equalTo: bg.trailingAnchor, constant: 20).isActive = true
        lItem.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.addSubview(lPrice)
        lPrice.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        lPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26).isActive = true
    }
}
