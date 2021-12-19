//
//  CreateExpenseVC.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class CreateExpenseVC: UIViewController {
    var presentor: CreateExpenseViewToPresenterProtocol?
    public var delegate: CreateExpenseDelegate!
    var tableHeight: CGFloat = 0
    
    var items: [String] = ["","","","","","","","","","","","","",""]
    let scrollView: UIScrollView = {
        let s = UIScrollView()
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    let container: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lMember: UILabel = UILabel()
        .configure { v in
            v.text = "MEMBER"
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textColor = Asset.Color.c5C5C5.color
            v.textAlignment = .left
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let memberSelectCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(SelectMemberCell.self, forCellWithReuseIdentifier: "selectMemberCell")
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    let lIcon: UILabel = UILabel()
        .configure { v in
            v.text = "ICON"
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textColor = Asset.Color.c5C5C5.color
            v.textAlignment = .left
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let iconButton: UIButton = UIButton()
        .configure { b in
            b.setImage(UIImage(named: "spotify"), for: .normal)
            b.widthAnchor.constraint(equalToConstant: 40).isActive = true
            b.heightAnchor.constraint(equalToConstant: 40).isActive = true
            b.backgroundColor = Asset.Color.c5Ffdf.color
            b.layer.cornerRadius = 12
            b.layer.masksToBounds = true
            b.translatesAutoresizingMaskIntoConstraints = false
            b.addTarget(self, action: #selector(iconButtonTapped), for: .touchUpInside)
        }
    
    let lTransactionName: UILabel = UILabel()
        .configure { v in
            v.text = "TRANSACTION NAME"
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textColor = Asset.Color.c5C5C5.color
            v.textAlignment = .left
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let tfTransactionName: UITextField = UITextField()
        .configure { v in
            v.placeholder = "Transaction name ..."
            v.backgroundColor = .systemGray6
            v.layer.cornerRadius = 12
            v.heightAnchor.constraint(equalToConstant: 40).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            v.leftView = view
            v.leftViewMode = .always
        }
    
    let lPaymentDate: UILabel = UILabel()
        .configure { v in
            v.text = "PAYMENT DATE"
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textColor = Asset.Color.c5C5C5.color
            v.textAlignment = .left
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let dpPaymentDate: UIDatePicker = UIDatePicker()
        .configure { v in
            v.datePickerMode = .dateAndTime
            v.preferredDatePickerStyle = .compact
            v.timeZone = NSTimeZone.local
            v.backgroundColor = UIColor.clear
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let itemTableView: UITableView = UITableView()
        .configure { v in
//            v.contentInset.top = 0
//            v.contentInset.bottom = 0
            v.separatorStyle = .none
            v.register(ItemCell.self, forCellReuseIdentifier: "itemCell")
            v.translatesAutoresizingMaskIntoConstraints = false
            v.isScrollEnabled = false
        }
    
    let bAddItem: UIButton = UIButton()
        .configure { v in
            v.setTitle("Add Item", for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            v.setTitleColor(Asset.Color._0078Ff.color, for: .normal)
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(addItemTapped), for: .touchUpInside)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Expense"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupViews()
        memberSelectCollection.delegate = self
        memberSelectCollection.dataSource = self
        
        itemTableView.delegate = self
        itemTableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createTapped))
        self.itemTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        self.itemTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if let newValue = change?[.newKey] {
                let newSize = newValue as! CGSize
                self.tableHeight = newSize.height
                
                DispatchQueue.main.async {
                    let tableHeightConstraint = [ self.itemTableView.heightAnchor.constraint(equalToConstant: self.tableHeight)
                    ]
                    NSLayoutConstraint.activate(tableHeightConstraint)
                }
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    @objc func iconButtonTapped() {
        presentor?.goToIcon(from: self)
    }
    
    @objc func createTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addItemTapped() {
        presentor?.goToAddItem(from: self)
    }
}

extension CreateExpenseVC: CreateExpensePresenterToViewProtocol {
    
}

extension CreateExpenseVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
        cell.lItem.text = String(indexPath.row + 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension CreateExpenseVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: -15, left: 26, bottom: 0, right: 26)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = memberSelectCollection.dequeueReusableCell(withReuseIdentifier: "selectMemberCell", for: indexPath) as! SelectMemberCell
        cell.cellSelected = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SelectMemberCell
        cell.cellSelected = !cell.cellSelected
    }
}

extension CreateExpenseVC {
    func setupViews() {
        setupScrollView()
        
        let v1 = UIView().configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.heightAnchor.constraint(equalToConstant: 100).isActive = true
            
            v.addSubview(lMember)
            lMember.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
            
            v.addSubview(memberSelectCollection)
            memberSelectCollection.topAnchor.constraint(equalTo: lMember.bottomAnchor,constant: 0).isActive = true
            memberSelectCollection.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: -26).isActive = true
            memberSelectCollection.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: 26).isActive = true
            memberSelectCollection.heightAnchor.constraint(equalToConstant: 95).isActive = true
            }
        
        let v2 = UIView().configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.heightAnchor.constraint(equalToConstant: 70).isActive = true
            
            v.addSubview(lIcon)
            lIcon.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
            lIcon.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
            
            v.addSubview(iconButton)
            iconButton.topAnchor.constraint(equalTo: lIcon.topAnchor, constant: 25).isActive = true
            iconButton.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
            
            v.addSubview(lTransactionName)
            lTransactionName.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
            lTransactionName.leadingAnchor.constraint(equalTo: lIcon.trailingAnchor, constant: 30).isActive = true
            
            v.addSubview(tfTransactionName)
            tfTransactionName.topAnchor.constraint(equalTo: lTransactionName.bottomAnchor, constant: 10).isActive = true
            tfTransactionName.leadingAnchor.constraint(equalTo:  iconButton.trailingAnchor, constant: 20).isActive = true
            tfTransactionName.trailingAnchor.constraint(equalTo: v.trailingAnchor).isActive = true
        }
        
        let v3 = UIView().configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.heightAnchor.constraint(equalToConstant: 70).isActive = true
            
            v.addSubview(lPaymentDate)
            lPaymentDate.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
            lPaymentDate.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
            
            v.addSubview(dpPaymentDate)
            dpPaymentDate.topAnchor.constraint(equalTo: lPaymentDate.bottomAnchor, constant: 10).isActive = true
            dpPaymentDate.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
        }
        
        let v4 = UIView().configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.heightAnchor.constraint(equalToConstant: 70).isActive = true
            
            v.addSubview(bAddItem)
            bAddItem.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
            bAddItem.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
        }
        
        container.addArrangedSubview(v1)
        container.addArrangedSubview(v2)
        container.addArrangedSubview(v3)
        container.addArrangedSubview(itemTableView)
        itemTableView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        itemTableView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
//        itemTableView.heightAnchor.constraint(equalToConstant: tableHeight.constant).isActive = true
        container.addArrangedSubview(v4)
        
    }
    
    func setupScrollView() {
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(container)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        container.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5).isActive = true
        container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // Important!
        container.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.90).isActive = true
        container.spacing = 20
    }
}

extension CreateExpenseVC: UITextFieldDelegate {
    // Text Field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}

