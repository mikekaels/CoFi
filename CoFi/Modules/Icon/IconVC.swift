//
//  IconVC.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class IconVC: UIViewController {
    var presentor: IconViewToPresenterProtocol?
    public var delegate: IconDelegate!
    
    let iconTableView: UITableView = UITableView(frame: .zero, style: .insetGrouped)
        .configure { v in
            v.register(IconCell.self, forCellReuseIdentifier: "iconCell")
            v.translatesAutoresizingMaskIntoConstraints = false
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select Icon"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupViews()
        iconTableView.delegate = self
        iconTableView.dataSource = self
    }

    
}

extension IconVC: IconPresenterToViewProtocol {
    
}

extension IconVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = iconTableView.dequeueReusableCell(withIdentifier: "iconCell", for: indexPath) as! IconCell
        return cell
    }
    
}

extension IconVC {
    func setupViews() {
        view.addSubview(iconTableView)
        iconTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        iconTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        iconTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        iconTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
}

class IconCell: UITableViewCell {
    
    let bgIcon: UIView = UIView()
        .configure { v in
            v.backgroundColor = Asset.Color.e3F2Ff.color
            v.layer.cornerRadius = 15

            v.widthAnchor.constraint(equalToConstant: 30).isActive = true
            v.heightAnchor.constraint(equalToConstant: 30).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let icon: UIImageView = UIImageView()
        .configure { v in
            v.image = UIImage(systemName: "drop")
            
            v.heightAnchor.constraint(equalToConstant: 20).isActive = true
            v.widthAnchor.constraint(equalToConstant: 20).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lIcon: UILabel = UILabel()
        .configure { v in
            v.text = "Water"
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textAlignment = .left
            
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.addSubview(bgIcon)
        bgIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        bgIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        
        bgIcon.addSubview(icon)
        icon.centerYAnchor.constraint(equalTo: bgIcon.centerYAnchor).isActive = true
        icon.centerXAnchor.constraint(equalTo: bgIcon.centerXAnchor).isActive = true
        
        contentView.addSubview(lIcon)
        lIcon.leadingAnchor.constraint(equalTo: bgIcon.trailingAnchor, constant: 10).isActive = true
        lIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
