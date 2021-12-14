//
//  AddItemPresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class AddItemPresenter: AddItemViewToPresenterProtocol {
    var view: AddItemPresenterToViewProtocol?
    var router: AddItemPresenterToRouterProtocol?
    var interactor: AddItemPresenterToInteractorProtocol?
    
    
}

extension AddItemPresenter: AddItemInteractorToPresenterProtocol {

}
