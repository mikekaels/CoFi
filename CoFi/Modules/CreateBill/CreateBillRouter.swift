//
//  CreateBillRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class CreateBillRouter: CreateBillPresenterToRouterProtocol{
    public static let shared = CreateBillRouter()
    
    func initialize() -> CreateBillVC {
        return createModule()
    }
    
    func createModule() -> CreateBillVC {
        let view = CreateBillVC()
        
        let presenter: CreateBillViewToPresenterProtocol & CreateBillInteractorToPresenterProtocol = CreateBillPresenter()
        
        let interactor: CreateBillPresenterToInteractorProtocol = CreateBillInteractor()
        
        let router: CreateBillPresenterToRouterProtocol = CreateBillRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func goToSelectReminderTime(from: CreateBillVC) {
        let vc = SelectReminderTimeRouter().createModule()
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToIcon(from: CreateBillVC) {
        let vc = IconRouter().createModule()
        from.navigationController?.pushViewController(vc, animated: true)
    }
}
