//
//  CreateGroupVC.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 13/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import IQKeyboardManagerSwift

class CreateGroupVC: UIViewController, MemberSelectedCellDelegate, InsertGroupDetailDelegate {
    
    var presentor: CreateGroupViewToPresenterProtocol?
    public var delegate: CreateGroupDelegate!
    
    var users: [User] = [User]()
    
    var selectedUser: [User] = [User]()
    
    let bBack: UIButton = UIButton()
        .configure { v in
            v.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            v.tintColor = .white
            v.widthAnchor.constraint(equalToConstant: 50).isActive = true
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(_dismiss), for: .touchUpInside)
        }
    
    let bCreate: UIButton = UIButton()
        .configure { v in
            v.setTitle("Create", for: .normal)
            v.tintColor = .white
            v.titleLabel?.textAlignment = .right
            v.widthAnchor.constraint(equalToConstant: 90).isActive = true
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(_createButtonTapped), for: .touchUpInside)
        }
    
    let bGroupImage: UIButton = UIButton()
        .configure { v in
            v.setImage(Asset.Image._1.image, for: .normal)
            v.contentMode = .scaleAspectFill
            
            v.widthAnchor.constraint(equalToConstant: 100).isActive = true
            v.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            v.layer.cornerRadius = 40
            v.layer.masksToBounds = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(groupImageTapped), for: .touchUpInside)
        }
    
    let lGroupName: UIButton = UIButton()
        .configure { v in
            v.setTitle("Group Name ", for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            v.setTitleColor(.white, for: .normal)
            v.semanticContentAttribute = .forceRightToLeft
            v.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
            v.tintColor = .white
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(groupNameTapped), for: .touchUpInside)
        }
    
    let memberSelectedCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MemberSelectedCell.self, forCellWithReuseIdentifier: "memberSelectedCell")
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    let bgSearchUser: UIView = UIView()
        .configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = .white
        }
    
    let searchBar: UISearchBar = UISearchBar()
            .configure { v in
                v.keyboardType = .emailAddress
                v.placeholder = "Search..."
                v.searchBarStyle = .minimal
                v.barStyle = .default
                
                v.translatesAutoresizingMaskIntoConstraints = false
            }
    
    let userSearchTableView: UITableView = UITableView()
        .configure { v in
            v.register(userSearchCell.self, forCellReuseIdentifier: "userSearchCell")
            v.translatesAutoresizingMaskIntoConstraints = false
            v.separatorStyle = .none
            v.contentInset.bottom = 30
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        // Do any additional setup after loading the view.
        setupViews()
        memberSelectedCollection.delegate = self
        memberSelectedCollection.dataSource = self
        
        userSearchTableView.delegate = self
        userSearchTableView.dataSource = self
        
        searchBar.delegate = self
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar(animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar(animated: animated)
    }
    
    override func viewWillLayoutSubviews() {
        bgSearchUser.roundCorners(corners: [.topLeft, .topRight], radius: 50.0)
    }
    
    @objc func _dismiss() {
        presentor?.back(from: self)
    }

    @objc func _createButtonTapped() {
        guard let groupName = lGroupName.titleLabel?.text else {
            return
        }
        
        print()
    }
    
    @objc func groupImageTapped() {
        
    }
    
    @objc func groupNameTapped() {
        presentor?.goToInsertGroupDetail(from: self)
    }
    
    // delegate
    func removeUser(email: String) {
        self.selectedUser.removeAll(where: {$0.email == email})
        DispatchQueue.main.async {
            self.memberSelectedCollection.reloadData()
            self.userSearchTableView.reloadData()
        }
    }
    
    func didSubmitGroupDetails(groupDetail: String) {
        DispatchQueue.main.async {
            self.lGroupName.setTitle(groupDetail, for: .normal)
        }
    }
}

extension CreateGroupVC: CreateGroupPresenterToViewProtocol {
    func didFetchUser(users: [User]) {
        self.users = users
        userSearchTableView.reloadData()
    }
}

extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userSearchTableView.dequeueReusableCell(withIdentifier: "userSearchCell", for: indexPath) as! userSearchCell
        let user = users[indexPath.row]
        cell.lUser.text = "\(user.first) \(user.second)"
        cell.lPhone.text = "\(user.email)"
        cell.profileImage.kf.setImage(with: URL(string: user.profileImageUrl))
        cell.checkBox.addTarget(cell, action: #selector(cell.checkBoxTapped), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! userSearchCell
        cell.checkBoxTapped()
        
        if cell.isChecked {
            selectedUser.append(users[indexPath.row])
            DispatchQueue.main.async {
                self.memberSelectedCollection.reloadData()
            }
        } else {
            selectedUser.removeAll(where: {$0.email == users[indexPath.row].email})
            DispatchQueue.main.async {
                self.memberSelectedCollection.reloadData()
            }
        }
    }
}

extension CreateGroupVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 26, bottom: 0, right: 26)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedUser.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = memberSelectedCollection.dequeueReusableCell(withReuseIdentifier: "memberSelectedCell", for: indexPath) as! MemberSelectedCell
        let user = selectedUser[indexPath.row]
        
        cell.profileImage.kf.setImage(with: URL(string: user.profileImageUrl))
        cell.lName.text = user.first
        cell.email = user.email
        
        cell.delegate = self
        return cell
    }
}

extension CreateGroupVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            presentor?.findUser(user: searchText)
        }
        searchBar.resignFirstResponder()
    }
    
    
}

extension CreateGroupVC {
    func setupViews() {
        view = GradientView(gradientStartColor: Asset.Color._00D8Ff.color, gradientEndColor: Asset.Color._0078Ff.color, startPoint: CGPoint(x: 1.0, y: 1.0),
                            endPoint: CGPoint(x: 0.1, y: 0.0))
        let blur = UIBlurEffect(style: .regular)
        let visualEffectBlur = UIVisualEffectView(effect: blur)
        view.addSubview(visualEffectBlur)
        visualEffectBlur.frame = view.frame
        
        view.addSubview(bBack)
        bBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        bBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        view.addSubview(bCreate)
        bCreate.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        bCreate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        view.addSubview(bGroupImage)
        bGroupImage.topAnchor.constraint(equalTo: bBack.bottomAnchor, constant: 10).isActive = true
        bGroupImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(lGroupName)
        lGroupName.topAnchor.constraint(equalTo: bGroupImage.bottomAnchor, constant: 15).isActive = true
        lGroupName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(memberSelectedCollection)
        memberSelectedCollection.topAnchor.constraint(equalTo: lGroupName.bottomAnchor, constant: 30).isActive = true
        memberSelectedCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        memberSelectedCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        memberSelectedCollection.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(bgSearchUser)
        bgSearchUser.topAnchor.constraint(equalTo: memberSelectedCollection.bottomAnchor, constant: 20).isActive = true
        bgSearchUser.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bgSearchUser.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bgSearchUser.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        bgSearchUser.addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: bgSearchUser.topAnchor, constant: 20).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: bgSearchUser.leadingAnchor, constant: 20).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: bgSearchUser.trailingAnchor, constant: -20).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        bgSearchUser.addSubview(userSearchTableView)
        userSearchTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10).isActive = true
        userSearchTableView.trailingAnchor.constraint(equalTo: bgSearchUser.trailingAnchor).isActive = true
        userSearchTableView.bottomAnchor.constraint(equalTo: bgSearchUser.bottomAnchor).isActive = true
        userSearchTableView.leadingAnchor.constraint(equalTo: bgSearchUser.leadingAnchor).isActive = true
    }
}

