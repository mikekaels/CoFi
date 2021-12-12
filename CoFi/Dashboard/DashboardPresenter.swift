//
//  DashboardPresenter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class DashboardPresenter: DashboardViewToPresenterProtocol {
    var view: DashboardPresenterToViewProtocol?
    var router: DashboardPresenterToRouterProtocol?
    var interactor: DashboardPresenterToInteractorProtocol?
    
    
}

extension DashboardPresenter: DashboardInteractorToPresenterProtocol {

}
