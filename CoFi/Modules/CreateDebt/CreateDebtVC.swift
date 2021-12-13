//
//  CreateDebtVC.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class CreateDebtVC: UIViewController {
    var presentor: CreateDebtViewToPresenterProtocol?
    public var delegate: CreateDebtDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }

}

extension CreateDebtVC: CreateDebtPresenterToViewProtocol {
    
}
