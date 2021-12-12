//
//  GroupPresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class GroupPresenter: GroupViewToPresenterProtocol {
    var view: GroupPresenterToViewProtocol?
    var router: GroupPresenterToRouterProtocol?
    var interactor: GroupPresenterToInteractorProtocol?
    
    
}

extension GroupPresenter: GroupInteractorToPresenterProtocol {

}
