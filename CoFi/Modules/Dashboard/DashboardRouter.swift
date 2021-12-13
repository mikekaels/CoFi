//
//  DashboardRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 12/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class DashboardRouter: DashboardPresenterToRouterProtocol{
    public static let shared = DashboardRouter()
    
    func initialize() -> DashboardVC {
        return createModule()
    }
    
    func createModule() -> DashboardVC {
        let view = DashboardVC()
        
        let presenter: DashboardViewToPresenterProtocol & DashboardInteractorToPresenterProtocol = DashboardPresenter()
        
        let interactor: DashboardPresenterToInteractorProtocol = DashboardInteractor()
        
        let router: DashboardPresenterToRouterProtocol = DashboardRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func goToCreateExpense(from: DashboardVC) {
        let vc = CreateExpenseRouter().createModule()
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToCreateBill(from: DashboardVC) {
        let vc = CreateBillRouter().createModule()
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToCreateDebt(from: DashboardVC) {
        let vc = CreateDebtRouter().createModule()
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToUserDebtDetails(from: DashboardVC) {
        let vc = UserDebtDetailsRouter().createModule()
        from.navigationController?.pushViewController(vc, animated: true)
    }
}
