//
//  CreateBillPresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class CreateBillPresenter: CreateBillViewToPresenterProtocol {
    var view: CreateBillPresenterToViewProtocol?
    var router: CreateBillPresenterToRouterProtocol?
    var interactor: CreateBillPresenterToInteractorProtocol?
    
    func goToSelectReminderTime(from: CreateBillVC) {
        router?.goToSelectReminderTime(from: from)
    }
}

extension CreateBillPresenter: CreateBillInteractorToPresenterProtocol {

}
