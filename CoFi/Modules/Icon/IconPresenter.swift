//
//  IconPresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 15/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class IconPresenter: IconViewToPresenterProtocol {
    var view: IconPresenterToViewProtocol?
    var router: IconPresenterToRouterProtocol?
    var interactor: IconPresenterToInteractorProtocol?
    
    
}

extension IconPresenter: IconInteractorToPresenterProtocol {

}
