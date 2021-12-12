//
//  TransactionPresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class TransactionPresenter: TransactionViewToPresenterProtocol {
    var view: TransactionPresenterToViewProtocol?
    var router: TransactionPresenterToRouterProtocol?
    var interactor: TransactionPresenterToInteractorProtocol?
    
    
}

extension TransactionPresenter: TransactionInteractorToPresenterProtocol {

}
