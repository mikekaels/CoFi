//
//  AddItemVC.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class AddItemVC: UIViewController {
    var presentor: AddItemViewToPresenterProtocol?
    public var delegate: AddItemDelegate!

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
    
    let lItemName: UILabel = UILabel()
        .configure { v in
            v.text = "ITEM NAME"
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textColor = Asset.Color.c5C5C5.color
            v.textAlignment = .left
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let tfItemName: UITextField = UITextField()
        .configure { v in
            v.placeholder = "Item Name"
            v.backgroundColor = .systemGray6
            v.layer.cornerRadius = 12
            v.heightAnchor.constraint(equalToConstant: 40).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            v.leftView = view
            v.leftViewMode = .always
        }
    
    let lNumberItem: UILabel = UILabel()
        .configure { v in
            v.text = "NUMBER OF ITEM"
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textColor = Asset.Color.c5C5C5.color
            v.textAlignment = .left
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let tfNumberItem: UITextField = UITextField()
        .configure { v in
            v.placeholder = "1"
            v.backgroundColor = .systemGray6
            v.layer.cornerRadius = 12
            v.heightAnchor.constraint(equalToConstant: 40).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            v.leftView = view
            v.leftViewMode = .always
        }
    
    let lTotalPrice: UILabel = UILabel()
        .configure { v in
            v.text = "TOTAL PRICE"
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textColor = Asset.Color.c5C5C5.color
            v.textAlignment = .left
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let tfTotalPrice: UITextField = UITextField()
        .configure { v in
            v.keyboardType = .numberPad
            v.placeholder = "0"
            v.backgroundColor = .systemGray6
            v.layer.cornerRadius = 12
            v.heightAnchor.constraint(equalToConstant: 40).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)).configure { v in
                v.backgroundColor = .red
                v.widthAnchor.constraint(equalToConstant: 40).isActive = true
                v.heightAnchor.constraint(equalToConstant: v.frame.height).isActive = true
                v.translatesAutoresizingMaskIntoConstraints = false
            }
            v.leftView = view
            let rp = UILabel()
                .configure { l in
                    l.text = "Rp"
                    l.textColor = .systemGray3
                    l.center = view.center
                    l.translatesAutoresizingMaskIntoConstraints = false
                }
            
            view.addSubview(rp)
            rp.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            rp.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
            v.leftViewMode = .always
        }

    let lPricePerItem: UILabel = UILabel()
        .configure { v in
            v.text = "PRICE PER-ITEM: Rp"
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textColor = Asset.Color.c5C5C5.color
            v.textAlignment = .left
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lPricePerItemAmount: UILabel = UILabel()
        .configure { v in
            v.text = "500000"
            v.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            v.textColor = Asset.Color._0078Ff.color
            v.textAlignment = .left
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Item Details"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupViews()
        memberSelectCollection.delegate = self
        memberSelectCollection.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension AddItemVC: AddItemPresenterToViewProtocol {
    
}

extension AddItemVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        return cell
    }
}

extension AddItemVC {
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
            
            v.addSubview(lItemName)
            lItemName.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
            lItemName.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
            
            v.addSubview(tfItemName)
            tfItemName.topAnchor.constraint(equalTo: lItemName.bottomAnchor, constant: 10).isActive = true
            tfItemName.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
            tfItemName.trailingAnchor.constraint(equalTo: v.trailingAnchor).isActive = true
        }
        
        let v3 = UIView().configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.heightAnchor.constraint(equalToConstant: 70).isActive = true
            
            v.addSubview(lNumberItem)
            lNumberItem.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
            lNumberItem.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
            
            v.addSubview(tfNumberItem)
            tfNumberItem.topAnchor.constraint(equalTo: lNumberItem.bottomAnchor, constant: 10).isActive = true
            tfNumberItem.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
            tfNumberItem.trailingAnchor.constraint(equalTo: v.trailingAnchor).isActive = true
        }
        
        let v4 = UIView().configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.heightAnchor.constraint(equalToConstant: 70).isActive = true
            
            v.addSubview(lTotalPrice)
            lTotalPrice.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
            lTotalPrice.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
            
            v.addSubview(tfTotalPrice)
            tfTotalPrice.topAnchor.constraint(equalTo: lTotalPrice.bottomAnchor, constant: 10).isActive = true
            tfTotalPrice.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
            tfTotalPrice.trailingAnchor.constraint(equalTo: v.trailingAnchor).isActive = true
        }
        
        let v5 = UIView().configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.heightAnchor.constraint(equalToConstant: 70).isActive = true
            
            v.addSubview(lPricePerItem)
            lPricePerItem.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
            lPricePerItem.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
            
            v.addSubview(lPricePerItemAmount)
            lPricePerItemAmount.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
            lPricePerItemAmount.leadingAnchor.constraint(equalTo: lPricePerItem.trailingAnchor, constant: 5).isActive = true
        }
        
        container.addArrangedSubview(v1)
        container.addArrangedSubview(v2)
        container.addArrangedSubview(v3)
        container.addArrangedSubview(v4)
        container.addArrangedSubview(v5)
        
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
