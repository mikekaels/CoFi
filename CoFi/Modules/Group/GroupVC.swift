//
//  GroupVC.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class GroupVC: UIViewController {
    var presentor: GroupViewToPresenterProtocol?
    public var delegate: GroupDelegate!
    
    let bJoin: UIButton = UIButton()
        .configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.setTitle("  Join", for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            v.setTitleColor(Asset.Color._0078Ff.color, for: .normal)
            v.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(joinButtonTapped), for: .touchUpInside)
        }
    
    let bCreate: UIButton = UIButton()
        .configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.setTitle("  Create", for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            v.setTitleColor(Asset.Color._0078Ff.color, for: .normal)
            v.setImage(UIImage(systemName: "plus"), for: .normal)
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        }
    
    let groupTableView: UITableView = UITableView()
        .configure { v in
            v.contentInset.top = 30
            v.contentInset.bottom = 30
            v.separatorStyle = .none
            v.register(GroupCell.self, forCellReuseIdentifier: "groupCell")
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Group"
        view.backgroundColor = .white
        groupTableView.delegate = self
        groupTableView.dataSource = self
        setupViews()
    }
    
    @objc func joinButtonTapped() {
        print("Hello World")
    }
    
    @objc func createButtonTapped() {
        presentor?.goToCreateGroup(from: self)
    }
    
}

extension GroupVC: GroupPresenterToViewProtocol {
    
}

extension GroupVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groupTableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupCell
        cell.id = String(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 154
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        groupTableView.deselectRow(at: indexPath, animated: true)
        presentor?.goToDetail(from: self, index: String(indexPath.row))
    }
}

extension GroupVC {
    func setupViews() {
        let sv1 = UIStackView()
            .configure(completion: { v in
                v.translatesAutoresizingMaskIntoConstraints = false
                v.distribution = .fillEqually
                v.addArrangedSubview(bJoin)
                v.addArrangedSubview(bCreate)
                v.spacing = 20
            })
        view.addSubview(sv1)
        sv1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        sv1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4).isActive = true
        sv1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(groupTableView)
        groupTableView.topAnchor.constraint(equalTo: sv1.bottomAnchor, constant: 30).isActive = true
        groupTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        groupTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        groupTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
}
