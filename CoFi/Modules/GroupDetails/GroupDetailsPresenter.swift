//
//  GroupDetailsPresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 13/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class GroupDetailsPresenter: GroupDetailsViewToPresenterProtocol {
    var view: GroupDetailsPresenterToViewProtocol?
    var router: GroupDetailsPresenterToRouterProtocol?
    var interactor: GroupDetailsPresenterToInteractorProtocol?
    
    func back(from: GroupDetailsVC) {
        router?.back(from: from)
    }
}

extension GroupDetailsPresenter: GroupDetailsInteractorToPresenterProtocol {

}
