//
//  UserDebtDetailsRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class UserDebtDetailsRouter: UserDebtDetailsPresenterToRouterProtocol{
    public static let shared = UserDebtDetailsRouter()
    
    func initialize() -> UserDebtDetailsVC {
        return createModule()
    }
    
    func createModule() -> UserDebtDetailsVC {
        let view = UserDebtDetailsVC()
        
        let presenter: UserDebtDetailsViewToPresenterProtocol & UserDebtDetailsInteractorToPresenterProtocol = UserDebtDetailsPresenter()
        
        let interactor: UserDebtDetailsPresenterToInteractorProtocol = UserDebtDetailsInteractor()
        
        let router: UserDebtDetailsPresenterToRouterProtocol = UserDebtDetailsRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
