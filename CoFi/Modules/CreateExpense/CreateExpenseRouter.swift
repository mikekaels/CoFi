//
//  CreateExpenseRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class CreateExpenseRouter: CreateExpensePresenterToRouterProtocol{
    public static let shared = CreateExpenseRouter()
    
    func initialize() -> CreateExpenseVC {
        return createModule()
    }
    
    func createModule() -> CreateExpenseVC {
        let view = CreateExpenseVC()
        
        let presenter: CreateExpenseViewToPresenterProtocol & CreateExpenseInteractorToPresenterProtocol = CreateExpensePresenter()
        
        let interactor: CreateExpensePresenterToInteractorProtocol = CreateExpenseInteractor()
        
        let router: CreateExpensePresenterToRouterProtocol = CreateExpenseRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func goToAddItem(from: CreateExpenseVC) {
        let vc = AddItemRouter().createModule()
        from.navigationController?.pushViewController(vc, animated: true)
    }
}
