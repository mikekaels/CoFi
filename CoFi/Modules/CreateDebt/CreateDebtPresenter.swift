//
//  CreateDebtPresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class CreateDebtPresenter: CreateDebtViewToPresenterProtocol {
    var view: CreateDebtPresenterToViewProtocol?
    var router: CreateDebtPresenterToRouterProtocol?
    var interactor: CreateDebtPresenterToInteractorProtocol?
    
    
}

extension CreateDebtPresenter: CreateDebtInteractorToPresenterProtocol {

}
