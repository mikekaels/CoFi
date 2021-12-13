//
//  InsertGroupDetailVC.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class InsertGroupDetailVC: UIViewController {
    var presentor: InsertGroupDetailViewToPresenterProtocol?
    public var delegate: InsertGroupDetailDelegate!
    
    let tfName: UITextField = UITextField()
        .configure { v in
            v.placeholder = "Group name ..."
            v.backgroundColor = .systemGray6
            v.layer.cornerRadius = 12
            v.heightAnchor.constraint(equalToConstant: 40).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            v.leftView = view
            v.leftViewMode = .always
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Insert Group Detail"
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitTapped))
    }
    
    @objc func submitTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupViews() {
        view.addSubview(tfName)
        tfName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
        tfName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26).isActive = true
        tfName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }

}

extension InsertGroupDetailVC: InsertGroupDetailPresenterToViewProtocol {
    
}
