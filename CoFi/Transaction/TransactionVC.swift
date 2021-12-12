//
//  TransactionVC.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class TransactionVC: UIViewController {
    var presentor: TransactionViewToPresenterProtocol?
    public var delegate: TransactionDelegate!
    
    var transactionData: [Transaction] = [

    ]
    
    let transactionTableView: UITableView = UITableView()
        .configure { v in
            v.backgroundColor = .clear
            v.separatorStyle = .none
            v.register(TransactionCell.self, forCellReuseIdentifier: "transactionCell")
            v.translatesAutoresizingMaskIntoConstraints = false
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Transaction"
        transactionTableView.dataSource = self
        transactionTableView.delegate = self
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setupViews() {
        view.addSubview(transactionTableView)
        transactionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        transactionTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        transactionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        transactionTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension TransactionVC: TransactionPresenterToViewProtocol {
    
}

extension TransactionVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "14 Oct 2021"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionTableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

