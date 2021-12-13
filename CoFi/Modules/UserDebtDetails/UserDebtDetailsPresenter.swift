//
//  UserDebtDetailsPresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class UserDebtDetailsPresenter: UserDebtDetailsViewToPresenterProtocol {
    var view: UserDebtDetailsPresenterToViewProtocol?
    var router: UserDebtDetailsPresenterToRouterProtocol?
    var interactor: UserDebtDetailsPresenterToInteractorProtocol?
    
    
}

extension UserDebtDetailsPresenter: UserDebtDetailsInteractorToPresenterProtocol {

}
