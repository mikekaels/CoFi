//
//  GroupDetailsVC.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 13/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class GroupDetailsVC: UIViewController {
    var presentor: GroupDetailsViewToPresenterProtocol?
    public var delegate: GroupDetailsDelegate!
    var id: String?
    
    let bBack: UIButton = UIButton()
        .configure { v in
            v.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            v.tintColor = .white
            v.widthAnchor.constraint(equalToConstant: 50).isActive = true
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(_dismiss), for: .touchUpInside)
        }
    
    let bAdd: UIButton = UIButton()
        .configure { v in
            v.setImage(UIImage(systemName: "plus"), for: .normal)
            v.tintColor = .white
            v.widthAnchor.constraint(equalToConstant: 50).isActive = true
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(_add), for: .touchUpInside)
        }
    
    let bGroupImage: UIButton = UIButton()
        .configure { v in
            v.setImage(Asset.Image._1.image, for: .normal)
            v.contentMode = .scaleAspectFill
            
            v.widthAnchor.constraint(equalToConstant: 154).isActive = true
            v.heightAnchor.constraint(equalToConstant: 154).isActive = true
            
            v.layer.cornerRadius = 54
            v.layer.masksToBounds = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(groupImageTapped), for: .touchUpInside)
        }
    
    let lGroup: UILabel = UILabel()
        .configure { v in
            v.text = "Group Name"
            v.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            v.textAlignment = .left
            v.textColor = .white
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lPeople: UILabel = UILabel()
        .configure { v in
            v.text = "6 People"
            v.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            v.textAlignment = .left
            v.textColor = .white
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let bgMember: UIView = UIView()
        .configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = .white
            
        }
    
    let memberTableView: UITableView = UITableView()
        .configure { v in
            v.register(MemberGroupCell.self, forCellReuseIdentifier: "memberGroupCell")
            v.translatesAutoresizingMaskIntoConstraints = false
            v.separatorStyle = .none
            v.contentInset.top = 30
            v.contentInset.bottom = 30
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        view.backgroundColor = .white
        memberTableView.delegate = self
        memberTableView.dataSource = self
        setupViews()
    }
    
    override func viewWillLayoutSubviews() {
        bgMember.roundCorners(corners: [.topLeft, .topRight], radius: 50.0)
    }
    
    @objc func groupImageTapped() {
        print("Hello World")
    }

    @objc func _dismiss() {
        presentor?.back(from: self)
    }
    
    @objc func _add() {
        print("Add")
    }
}

extension GroupDetailsVC: GroupDetailsPresenterToViewProtocol {
    
}

extension GroupDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = memberTableView.dequeueReusableCell(withIdentifier: "memberGroupCell", for: indexPath) as! MemberGroupCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension GroupDetailsVC {
    func setupViews() {
        
        view = GradientView(gradientStartColor: Asset.Color._00D8Ff.color, gradientEndColor: Asset.Color._0078Ff.color, startPoint: CGPoint(x: 1.0, y: 1.0),
                            endPoint: CGPoint(x: 0.1, y: 0.0))
        let blur = UIBlurEffect(style: .regular)
        let visualEffectBlur = UIVisualEffectView(effect: blur)
        view.addSubview(visualEffectBlur)
        visualEffectBlur.frame = view.frame
        
        view.addSubview(bGroupImage)
        bGroupImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        bGroupImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(bBack)
        bBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        bBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        view.addSubview(bAdd)
        bAdd.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        bAdd.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        view.addSubview(lGroup)
        lGroup.topAnchor.constraint(equalTo: bGroupImage.bottomAnchor, constant: 20).isActive = true
        lGroup.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(lPeople)
        lPeople.topAnchor.constraint(equalTo: lGroup.bottomAnchor, constant: 10).isActive = true
        lPeople.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(bgMember)
        bgMember.topAnchor.constraint(equalTo: lPeople.bottomAnchor, constant: 20).isActive = true
        bgMember.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bgMember.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bgMember.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        bgMember.addSubview(memberTableView)
        memberTableView.topAnchor.constraint(equalTo: bgMember.topAnchor).isActive = true
        memberTableView.trailingAnchor.constraint(equalTo: bgMember.trailingAnchor).isActive = true
        memberTableView.bottomAnchor.constraint(equalTo: bgMember.bottomAnchor).isActive = true
        memberTableView.leadingAnchor.constraint(equalTo: bgMember.leadingAnchor).isActive = true
    }
}

