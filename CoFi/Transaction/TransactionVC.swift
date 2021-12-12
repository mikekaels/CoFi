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
            v.register(TransactionCell.self, forCellReuseIdentifier: "transactionCell")
            v.translatesAutoresizingMaskIntoConstraints = false
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transactions"
        transactionTableView.dataSource = self
        transactionTableView.delegate = self
        
        setupViews()
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

class TransactionCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
