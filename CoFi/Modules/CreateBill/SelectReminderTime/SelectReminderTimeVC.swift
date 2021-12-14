//
//  SelectReminderTimeVC.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class SelectReminderTimeVC: UIViewController {
    var presentor: SelectReminderTimeViewToPresenterProtocol?
    public var delegate: SelectReminderTimeDelegate!
    
    var selections: [String] = ["One day before", "1 Week Before"]

    let scrollView: UIScrollView = {
        let s = UIScrollView()
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: UITableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        .configure { v in
            v.backgroundColor = .systemGray6
            v.isScrollEnabled = false
            v.register(UITableViewCell.self, forCellReuseIdentifier: "selectReminderCell")
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select Reminder Time"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupViews()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SelectReminderTimeVC: SelectReminderTimePresenterToViewProtocol {
    
}

extension SelectReminderTimeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "selectReminderCell")
        cell.textLabel?.text = selections[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: true)
    }
}

extension SelectReminderTimeVC {
    func setupViews() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
}
