//
//  CreateGroupPresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 13/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class CreateGroupPresenter: CreateGroupViewToPresenterProtocol {
    var view: CreateGroupPresenterToViewProtocol?
    var router: CreateGroupPresenterToRouterProtocol?
    var interactor: CreateGroupPresenterToInteractorProtocol?
    
    func back(from: CreateGroupVC) {
        router?.back(from: from)
    }
    
    func goToInsertGroupDetail(from: CreateGroupVC) {
        router?.goToInsertGroupDetail(from: from)
    }
}

extension CreateGroupPresenter: CreateGroupInteractorToPresenterProtocol {

}
