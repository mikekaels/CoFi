//
//  SelectReminderTimePresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class SelectReminderTimePresenter: SelectReminderTimeViewToPresenterProtocol {
    var view: SelectReminderTimePresenterToViewProtocol?
    var router: SelectReminderTimePresenterToRouterProtocol?
    var interactor: SelectReminderTimePresenterToInteractorProtocol?
    
    
}

extension SelectReminderTimePresenter: SelectReminderTimeInteractorToPresenterProtocol {

}
