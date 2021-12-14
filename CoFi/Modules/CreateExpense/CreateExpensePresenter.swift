//
//  CreateExpensePresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class CreateExpensePresenter: CreateExpenseViewToPresenterProtocol {
    var view: CreateExpensePresenterToViewProtocol?
    var router: CreateExpensePresenterToRouterProtocol?
    var interactor: CreateExpensePresenterToInteractorProtocol?
    
    func goToAddItem(from: CreateExpenseVC) {
        router?.goToAddItem(from: from)
    }
}

extension CreateExpensePresenter: CreateExpenseInteractorToPresenterProtocol {

}
