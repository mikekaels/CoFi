//
//  DashboardProtocol.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol DashboardDelegate {
    
}

protocol DashboardViewToPresenterProtocol: AnyObject {
    var view: DashboardPresenterToViewProtocol? { get set }
    var interactor: DashboardPresenterToInteractorProtocol? { get set }
    var router: DashboardPresenterToRouterProtocol? { get set }
    
    func goToCreateExpense(from: DashboardVC)
    func goToCreateBill(from: DashboardVC)
    func goToCreateDebt(from: DashboardVC)
    func goToUserDebtDetails(from: DashboardVC)
}

protocol DashboardPresenterToRouterProtocol: AnyObject {
    func createModule() -> DashboardVC
    func goToCreateExpense(from: DashboardVC)
    func goToCreateBill(from: DashboardVC)
    func goToCreateDebt(from: DashboardVC)
    func goToUserDebtDetails(from: DashboardVC)
}

protocol DashboardPresenterToViewProtocol: AnyObject {

}

protocol DashboardInteractorToPresenterProtocol: AnyObject {

}

protocol DashboardPresenterToInteractorProtocol: AnyObject {
    var presenter: DashboardInteractorToPresenterProtocol? { get set }

}
