//
//  CreateDebtRouter.swift
//  CoFi
//
//  Created by Santo Michael Sihombing on 14/12/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class CreateDebtRouter: CreateDebtPresenterToRouterProtocol{
    public static let shared = CreateDebtRouter()
    
    func initialize() -> CreateDebtVC {
        return createModule()
    }
    
    func createModule() -> CreateDebtVC {
        let view = CreateDebtVC()
        
        let presenter: CreateDebtViewToPresenterProtocol & CreateDebtInteractorToPresenterProtocol = CreateDebtPresenter()
        
        let interactor: CreateDebtPresenterToInteractorProtocol = CreateDebtInteractor()
        
        let router: CreateDebtPresenterToRouterProtocol = CreateDebtRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
