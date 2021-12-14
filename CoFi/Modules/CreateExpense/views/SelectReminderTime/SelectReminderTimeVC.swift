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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select Reminder Time"
        // Do any additional setup after loading the view.
    }
    
    

}

extension SelectReminderTimeVC: SelectReminderTimePresenterToViewProtocol {
    
}
