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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        // Do any additional setup after loading the view.
    }

}

extension GroupVC: GroupPresenterToViewProtocol {
    
}
