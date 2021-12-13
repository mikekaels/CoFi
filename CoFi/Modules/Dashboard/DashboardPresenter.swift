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
    
    func goToCreateBill(from: DashboardVC) {
        router?.goToCreateBill(from: from)
    }
    
    func goToCreateExpense(from: DashboardVC) {
        router?.goToCreateExpense(from: from)
    }
    
    func goToCreateDebt(from: DashboardVC) {
        router?.goToCreateDebt(from: from)
    }
    
    func goToUserDebtDetails(from: DashboardVC) {
        router?.goToUserDebtDetails(from: from)
    }
}

extension DashboardPresenter: DashboardInteractorToPresenterProtocol {

}
